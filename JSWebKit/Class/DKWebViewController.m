//
//  DKWebViewController.m
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/8.
//

#import "DKWebViewController.h"
#import "DKWebAppearance.h"
#import "DKWebView.h"
#import "Masonry.h"

#define kScreen_Height [UIScreen mainScreen].bounds.size.height
#define kScreen_Width  [UIScreen mainScreen].bounds.size.width
#define kStatusBar_Height [[UIApplication sharedApplication] statusBarFrame].size.height

NSString * const DKWebViewKeyEstimateProgress = @"estimatedProgress";

@interface DKWebViewController () <WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong) DKWebView *webView;
@property (nonatomic) UIProgressView *progressView;

@end

@implementation DKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initNaviItem];
    [self createBaseView];
}

- (void)createBaseView {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.webView];
    [self.webView addSubview:self.progressView];
    [self registerJsBridge];
    [self.webView addObserver:self forKeyPath:DKWebViewKeyEstimateProgress options:NSKeyValueObservingOptionNew context:nil];
}

- (void)registerJsBridge {
    _jsBridge = [WebViewJavascriptBridge bridgeForWebView:_webView];
    [_jsBridge setWebViewDelegate:self];
    [self.bridgeManager registerJavaScriptHandler:_jsBridge];
}

- (void)initNaviItem {
    UIImage *backImage = [DKWebAppearance sharedAppearance].backItemImage;
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:backImage style:UIBarButtonItemStylePlain target:self action:@selector(naviBackButtonClicked)];

    UIImage *closeImage = [DKWebAppearance sharedAppearance].closeItemImage;
    UIBarButtonItem *closeItem = [[UIBarButtonItem alloc] initWithImage:closeImage style:UIBarButtonItemStylePlain target:self action:@selector(closeButtonClicked)];
    self.navigationItem.leftBarButtonItems = @[backItem,closeItem];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (object == self.webView && [keyPath isEqualToString:DKWebViewKeyEstimateProgress]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        [self.progressView setProgress:newprogress animated:YES];
        if (newprogress >= 1) {
            [UIView animateWithDuration:0.25f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
            } completion:^(BOOL finished) {
                self.progressView.hidden = YES;
            }];
        }
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

#pragma mark -- load request
- (void)loadRequest:(NSURLRequest *)request {
    [self.webView loadRequest:request];
}

- (void)loadURL:(NSURL *)url {
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
}

- (void)loadHTMLString:(NSString *)htmlString baseURL:(nullable NSURL *)baseURL {
    [self.webView loadHTMLString:htmlString baseURL:baseURL];
}

#pragma mark - click method
- (void)naviBackButtonClicked {
    if ([self.webView canGoBack]) {
        [self.webView goBack];
    } else {
        [self closeButtonClicked];
    }
}

- (void)closeButtonClicked {
    [self.view resignFirstResponder];
    if (self.navigationController
        && self.navigationController.viewControllers.count > 1) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

#pragma mark - WKNavigationDelegate
//开始加载
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation  API_AVAILABLE(ios(8.0)){
    NSLog(@"开始加载网页");
    //开始加载网页时展示出progressView
    self.progressView.hidden = NO;
}

//加载完成
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation  API_AVAILABLE(ios(8.0)){
    NSLog(@"加载完成");
    //加载完成后隐藏progressView
    [self.jsBridge callHandler:@"refreshData" data:nil responseCallback:^(id responseData) {
        NSLog(@"Refresh Data Done");
    }];
}

//加载失败
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error  API_AVAILABLE(ios(8.0)){
    NSLog(@"加载失败");
    //加载失败隐藏progressView
    self.progressView.hidden = YES;
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    NSURL *URL = navigationAction.request.URL;
    NSString *scheme = [URL scheme];
    
    if ([scheme isEqualToString:@"tel"]) {
        NSString *resourceSpecifier = [URL resourceSpecifier];
        NSString *callPhone = [NSString stringWithFormat:@"telprompt://%@", resourceSpecifier];
        /// 防止iOS 10及其之后，拨打电话系统弹出框延迟出现
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:callPhone]];
        });
    }
    decisionHandler(WKNavigationActionPolicyAllow);
}

#pragma mark - get & set
- (DKWebView *)webView {
    if (!_webView) {
        _webView = [[DKWebView alloc] initWithFrame:CGRectMake(0, 0, kScreen_Width, kScreen_Height-kStatusBar_Height-44)];
        if (self.addionalHeader) {
            _webView.additionHeader = self.addionalHeader;
        }
    }
    return _webView;
}

- (UIProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, kStatusBar_Height+44, CGRectGetWidth(self.view.frame), 2)];
        [_progressView setTintColor:[DKWebAppearance sharedAppearance].progressColor];
        _progressView.progress = 0.4;
        _progressView.backgroundColor = [UIColor whiteColor];
    }
    return _progressView;
}

- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:DKWebViewKeyEstimateProgress];
}
@end
