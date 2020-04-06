//
//  FGRoute.h
//  OCTemplate
//
//  Created by Ferris on 2020/4/6.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FGRouteAddress.h"



NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    FGViewControllerTransitionStylePresent,
    FGViewControllerTransitionStylePush,
    FGViewControllerTransitionStyleRootView //导航控制器的底层
} FGViewControllerTransitionStyle;

@protocol FGViewControllerRouteProtocol <NSObject>

- (instancetype)initFromFGAddress:(FGRouteAddress*)address;

@optional
//默认是push
- (FGViewControllerTransitionStyle)preferredTransitionStyleForUrlAddress:(FGRouteAddress*)address;
//自己处理跳转
- (void)routerHandleTranstionBySelfWithRootNavigationController:(UINavigationController*)navi;
@end
@interface FGRoute : NSObject
+ (void)loadUrl:(NSString*)url;
+ (void)loadFGAddress:(FGRouteAddress*)address;

+ (void)setRootNavigationController:(UINavigationController*)rootNavigationController;
+ (UINavigationController*)rootNavigationController;
@end

NS_ASSUME_NONNULL_END
