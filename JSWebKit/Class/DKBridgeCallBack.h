//
//  DKBridgeCallBack.h
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/9.
//

#import <Foundation/Foundation.h>
#import "WebViewJavascriptBridge.h"

NS_ASSUME_NONNULL_BEGIN

@interface DKBridgeCallBack : NSObject
// js回调
+ (void)wrapResponseCallBack:(WVJBResponseCallback)responseCallBack
                     message:(NSString*)message result:(BOOL)result responseObject:(id)responseObject;

@end

NS_ASSUME_NONNULL_END
