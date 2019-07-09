//
//  DKWebView.h
//  JSBridgeDemo
//
//  Created by 崔冰smile on 2019/7/8.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKWebView : WKWebView

//传递给web页面的请求header
@property (nonatomic, strong) NSDictionary *additionHeader;

@end

NS_ASSUME_NONNULL_END
