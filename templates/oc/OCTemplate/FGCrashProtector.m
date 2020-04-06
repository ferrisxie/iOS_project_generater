//
//  FGCrashProtector.m
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/24.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGCrashProtector.h"
//#import <Bugly/Bugly.h>

@implementation FGCrashProtector
DEF_SINGLETON(FGCrashProtector)
- (void)prepare{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:UIApplicationWillTerminateNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:kUserLoginStatusDidChangeNotification object:nil];
}
+(void)setUp{
//    [Bugly startWithAppId:@""];
    [[FGCrashProtector sharedInstance] prepare];
}
#pragma mark - bugly
+(void)setKeyInfoForCrashDebug:(NSString *)info forKey:(NSString *)key{
    if(info.length > 0 && key.length > 0){
//        [Bugly setUserValue:info forKey:key];
    }
}
+(void)reportError:(NSError *)error{
//    [Bugly reportError:error];
}
+(void)reportException:(NSException *)exception{
//    [Bugly reportException:exception];
}
#pragma mark - notification
- (void)didReceiveNotification:(NSNotification*)n{
    if([n.name isEqualToString:UIApplicationWillTerminateNotification]){
        [self willCrash];
    }
}
- (void)willCrash{
    [[NSNotificationCenter defaultCenter] postNotificationName:kSystemWillCrashNotifictaion object:nil];
}
@end
