//
//  FGNetworkManager.m
//  OCTemplate
//
//  Created by Ferris on 2020/3/7.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGNetworkManager.h"
NSString* const FGNetWorkStatusChangeNotificationName = @"com.localhost.FGNetWorkStatusChangeNotificationName";
@implementation FGNetworkManager
{
    AFNetworkReachabilityManager* _reachabilityMangaer;
}
+(instancetype)shareManager
{
    static FGNetworkManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[FGNetworkManager alloc] init];
    });
    return  manager;
}
-(instancetype)init
{
    if(self = [super init])
    {
        //如果使用特定的域名会得到不正确的网络状态
        _reachabilityMangaer = [AFNetworkReachabilityManager sharedManager];
        [_reachabilityMangaer startMonitoring];
        [_reachabilityMangaer setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
            [[NSNotificationCenter defaultCenter] postNotificationName:FGNetWorkStatusChangeNotificationName object:nil];
        }];
    }
    return self;
}
-(AFNetworkReachabilityStatus)networkStatus
{
    return _reachabilityMangaer.networkReachabilityStatus;
}

-(BOOL)isNetworkConnected {
    AFNetworkReachabilityStatus status = [self networkStatus];
    if (status == AFNetworkReachabilityStatusNotReachable) {
        return NO;
    }
    return YES;
}
@end
