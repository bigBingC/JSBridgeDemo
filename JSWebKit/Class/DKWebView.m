//
//  DKWebView.m
//  JSBridgeDemo
//
//  Created by 崔冰smile on 2019/7/8.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "DKWebView.h"
#import "DKWebViewConfig.h"

@implementation DKWebView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
    }
    return self;
}

- (WKNavigation *)loadRequest:(NSURLRequest *)request {
    NSURL *url = request.URL;
    if (![DKWebViewConfig sharedInstance].enableWhiteList) {
        return [self loadRequest:request additionHeader:self.additionHeader];
    }
    //白名单
    for (NSString *host in [DKWebViewConfig sharedInstance].whiteList) {
        if (![self urlMatch:url.absoluteString host:host]) {
            continue;
        }
        return [self loadRequest:request additionHeader:self.additionHeader];
    }
}

- (BOOL)urlMatch:(NSString *)urlString host:(NSString *)host {
    return [urlString containsString:host];
}

- (WKNavigation *)loadRequest:(NSURLRequest *)request additionHeader:(NSDictionary *)additionHeader {
    NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:request.URL];
    for (NSString *key in additionHeader.allKeys) {
        NSString *value = additionHeader[key];
        [urlRequest setValue:value forHTTPHeaderField:key];
    }
    return [super loadRequest:urlRequest];
}

@end
