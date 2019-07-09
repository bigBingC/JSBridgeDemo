//
//  DKWebViewConfig.m
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/8.
//

#import "DKWebViewConfig.h"

@implementation DKWebViewConfig

+ (instancetype)sharedInstance {
    static DKWebViewConfig *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DKWebViewConfig alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.enableWhiteList = NO;
        self.whiteList = [NSMutableArray array];
    }
    return self;
}

@end
