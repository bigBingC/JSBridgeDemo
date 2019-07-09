//
//  DKWebViewController.h
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/8.
//

#import <UIKit/UIKit.h>
#import "WebViewJavascriptBridge.h"
#import "DKBridgeManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface DKWebViewController : UIViewController

@property (nonatomic) DKBridgeManager *bridgeManager;

@property (nonatomic) WebViewJavascriptBridge *jsBridge;
// 需要传入web的请求header
@property (nonatomic, copy) NSDictionary *addionalHeader;

// 网页加载请求
- (void)loadRequest:(NSURLRequest *)request;

// 网页加载网页URL
- (void)loadURL:(NSURL *)url;

// 加载 Html 字符串
- (void)loadHTMLString:(NSString *)htmlString baseURL:(nullable NSURL *)baseURL;

@end

NS_ASSUME_NONNULL_END
