//
//  DKBridgeManager.h
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/9.
//

#import <Foundation/Foundation.h>
#import "WebViewJavascriptBridge.h"
#import "DKWebBridgePlugin.h"

NS_ASSUME_NONNULL_BEGIN

@interface DKBridgeManager : NSObject

// WebView 的ViewController
@property (nonatomic, weak) UIViewController *containerViewController;

// 拓展的plugin（每次增加新交互不用频繁修改基础组件）
@property (nonatomic) NSMutableArray<id<DKWebBridgePlugin>> *pluginArray;

// 注册基础 JavaScript 的处理
- (void)registerJavaScriptHandler:(WebViewJavascriptBridge *)bridge;

@end

NS_ASSUME_NONNULL_END
