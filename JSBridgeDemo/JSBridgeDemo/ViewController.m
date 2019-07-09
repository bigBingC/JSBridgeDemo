//
//  ViewController.m
//  JSBridgeDemo
//
//  Created by 崔冰smile on 2019/7/8.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "DKWebViewController.h"
#import "DKBridgeManager.h"
#import "DKWebClickBridgePlugin.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btnJS = [[UIButton alloc] init];
    [btnJS setTitle:@"跳转web页面" forState:UIControlStateNormal];
    [btnJS setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnJS addTarget:self action:@selector(clickJSButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnJS];
    [btnJS mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

- (void)clickJSButton {
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"ExampleApp" ofType:@"html"];
    NSString *appHtml = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    NSURL *baseURL = [NSURL fileURLWithPath:htmlPath];
    
    DKWebViewController *webVC = [[DKWebViewController alloc] init];
    webVC.bridgeManager = [[DKBridgeManager alloc] init];
    DKWebClickBridgePlugin *clickPlugin = [[DKWebClickBridgePlugin alloc] init];
    [webVC.bridgeManager.pluginArray addObjectsFromArray:@[clickPlugin]];
    webVC.bridgeManager.containerViewController = webVC;
    [webVC loadHTMLString:appHtml baseURL:baseURL];
    [self.navigationController pushViewController:webVC animated:YES];
}

@end
