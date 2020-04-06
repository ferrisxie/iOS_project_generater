//
//  FGLogTool.m
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/25.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGLogTool.h"
#import "FGCrashProtector.h"
//#import "FGUserCenter.h"
@implementation FGLogTool
DEF_SINGLETON(FGLogTool)
+ (void)prepare{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:kSystemWillCrashNotifictaion object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveNotification:) name:kUserLoginStatusDidChangeNotification object:nil];
}
+(void)setUp{
    [self prepare];
}
+ (void)didReceiveNotification:(NSNotification*)n{
//
}
+ (void)reportImmediaty{
    
}
+(void)addLog:(NSString *)log withLevel:(FGLogLevel)level{
    if(log.length == 0){
        return;
    }
    DebugLog(@"%@_%@",@(level),log);
    NSString* key = [NSString stringWithFormat:@"level_%@_%@",@(level),@((uint64_t)[[NSDate date] timeIntervalSince1970])];
    if(level >= FGLogLevelDefault){

    }
    if(level >= FGLogLevelFatal){
        [FGCrashProtector setKeyInfoForCrashDebug:log forKey:key];
    }
}
@end
