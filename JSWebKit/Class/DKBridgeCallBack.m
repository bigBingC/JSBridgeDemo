//
//  DKBridgeCallBack.m
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/9.
//

#import "DKBridgeCallBack.h"

@implementation DKBridgeCallBack

+ (void)wrapResponseCallBack:(WVJBResponseCallback)responseCallBack message:(NSString *)message result:(BOOL)result responseObject:(id)responseObject {
    NSString *realMessage = message ? message : @"";
    if(!responseObject) {
        responseObject = @"";
    }
    NSDictionary *response = @{
                               @"result" : @(result),
                               @"message" : realMessage,
                               @"responseObject" : responseObject
                               };
    responseCallBack(response);
}
@end
