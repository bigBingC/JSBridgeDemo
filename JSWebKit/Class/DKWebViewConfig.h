//
//  DKWebViewConfig.h
//  JSWebKit
//
//  Created by 崔冰smile on 2019/7/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DKWebViewConfig : NSObject
//单例
+ (instancetype)sharedInstance;

//是否启动白名单
@property (nonatomic, assign) BOOL enableWhiteList;

//白名单
@property (nonatomic, strong) NSMutableArray *whiteList;

@end

NS_ASSUME_NONNULL_END
