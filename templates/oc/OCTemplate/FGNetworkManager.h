//
//  FGNetworkManager.h
//  OCTemplate
//
//  Created by Ferris on 2020/3/7.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworkReachabilityManager.h>
NS_ASSUME_NONNULL_BEGIN
extern  NSString* const FGNetWorkStatusChangeNotificationName;
@interface FGNetworkManager : NSObject
+ (instancetype)shareManager;

- (AFNetworkReachabilityStatus)networkStatus;

/**
 网络状态为Unknown时也默认有网络
 */
- (BOOL)isNetworkConnected;
@end

NS_ASSUME_NONNULL_END
