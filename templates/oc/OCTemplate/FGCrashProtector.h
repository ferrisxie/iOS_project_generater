//
//  FGCrashProtector.h
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/24.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGCrashProtector : NSObject
AS_SINGLETON(FGCrashProtector)
+(void)setKeyInfoForCrashDebug:(NSString *)info forKey:(NSString *)key;
+(void)setUp;
/**
 *  上报自定义异常
 *
 *  @param exception 异常信息
 */
+ (void)reportException:(nonnull NSException *)exception;

/**
 *  上报错误
 *
 *  @param error 错误信息
 */
+ (void)reportError:(NSError *)error;
@end

NS_ASSUME_NONNULL_END
