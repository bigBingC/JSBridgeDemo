//
//  DKWebClickBridgePlugin.m
//  JSBridgeDemo
//
//  Created by 崔冰smile on 2019/7/9.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "DKWebClickBridgePlugin.h"
#import "DKBridgeCallBack.h"

@implementation DKWebClickBridgePlugin

- (BOOL)registerBridge:(WebViewJavascriptBridge *)bridge {
    [bridge registerHandler:@"clickButton" handler:^(id data, WVJBResponseCallback responseCallback) {
        NSLog(@"-----%@",data);
        NSString *str = @"这是参数";
        [DKBridgeCallBack wrapResponseCallBack:responseCallback message:@"点击了" result:YES responseObject:str];
    }];
    return YES;
}
@end
