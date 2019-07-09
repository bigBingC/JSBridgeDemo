//
//  DKWebBridgePlugin.h
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/9.
//

#import <Foundation/Foundation.h>
@class WebViewJavascriptBridge;

NS_ASSUME_NONNULL_BEGIN

@protocol DKWebBridgePlugin <NSObject>
// Plugin在 WebViewJavascriptBridge 中 注册
- (BOOL)registerBridge:(WebViewJavascriptBridge *)bridge;

@optional

- (NSString *)handlerName;

- (BOOL)responseToHandler:(NSString *)handlerName;

- (void)performHandler:(NSString *)handlerName parameter:(NSObject *)parameter;

@end

NS_ASSUME_NONNULL_END
