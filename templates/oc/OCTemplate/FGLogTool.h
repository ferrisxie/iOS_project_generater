//
//  FGLogTool.h
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/25.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    FGLogLevelLow = 0, //不做任何处理 只打印
    FGLogLevelDefault, //默认上传到研发日志里
    FGLogLevelFatal, //同时写到bugly
} FGLogLevel;

@interface FGLogTool : NSObject


+ (void)setUp;
+ (void)addLog:(NSString*)log withLevel:(FGLogLevel)level;

+ (void)reportImmediaty;

@end

NS_ASSUME_NONNULL_END
