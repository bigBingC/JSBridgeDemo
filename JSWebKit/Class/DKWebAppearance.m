//
//  DKWebAppearance.m
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/9.
//

#import "DKWebAppearance.h"
#import "NSBundle+PodResource.h"
#import "UIImage+PodResource.h"

@implementation DKWebAppearance

+ (instancetype)sharedAppearance {
    static DKWebAppearance *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[DKWebAppearance alloc] init];
    });
    return _instance;
}

- (instancetype)init {
    if (self = [super init]) {
        self.progressColor = [UIColor grayColor];
        self.closeItemImage = [UIImage imageFromBundle:[NSBundle bundleName:@"JSWebKit"] imageName:@"webKitClose"];
        self.backItemImage = [UIImage imageFromBundle:[NSBundle bundleName:@"JSWebKit"] imageName:@"webKitNaviBack"];
    }
    return self;
}

@end
