//
//  DKBridgeManager.m
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/9.
//

#import "DKBridgeManager.h"
#import "DKBridgeCallBack.h"

@implementation DKBridgeManager

- (instancetype)init {
    if (self = [super init]) {
        self.pluginArray = [NSMutableArray array];
    }
    return self;
}

- (void)registerJavaScriptHandler:(WebViewJavascriptBridge *)bridge {
    // 拓展的plugin（每次增加新交互不用频繁修改基础组件）
    for (id<DKWebBridgePlugin>plugin in self.pluginArray) {
        [plugin registerBridge:bridge];
    }
    
    // 基础plugin可以放在这里
    __weak typeof(self) weakSelf = self;
    [bridge registerHandler:@"setNavigationInfo" handler:^(id data, WVJBResponseCallback responseCallback) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSDictionary *dict = (NSDictionary *)data;
        NSString *title = dict[@"toolbarTitle"];
        if (title.length == 0) {
            [DKBridgeCallBack wrapResponseCallBack:responseCallback message:@"title为空" result:NO responseObject:nil];
        }
        strongSelf.containerViewController.title = title;
        [DKBridgeCallBack wrapResponseCallBack:responseCallback message:nil result:YES responseObject:nil];
    }];
}

@end
