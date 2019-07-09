//
//  NSBundle+PodResource.m
//  JSBridgeDemo
//
//  Created by 崔冰smile on 2019/7/9.
//  Copyright © 2019 Ziwutong. All rights reserved.
//

#import "NSBundle+PodResource.h"

@implementation NSBundle (PodResource)

+ (NSBundle*)bundleName:(NSString*)bundleName {
    NSString *path = [[NSBundle mainBundle] pathForResource:bundleName ofType:@"bundle"];
    NSBundle *bundle = [NSBundle bundleWithPath:path];
    return bundle;
}
@end
