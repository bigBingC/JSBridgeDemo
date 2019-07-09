//
//  UIImage+PodResource.h
//  DKResourceLinkKit
//
//  Created by 崔冰smile on 2019/7/9.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (PodResource)

+ (UIImage *)imageFromBundle:(NSBundle *)bundle imageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
