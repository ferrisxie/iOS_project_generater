//
//  FGRoute.m
//  OCTemplate
//
//  Created by Ferris on 2020/4/6.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGRoute.h"
#import "FGViewControllerFactory.h"
static UINavigationController* gRootNavigationController;
@implementation FGRoute
+(void)loadUrl:(NSString *)url{
    if(url.length > 0){
        [self loadFGAddress:[[FGRouteAddress alloc] initWithString:url]];
    }
}
+(void)loadFGAddress:(FGRouteAddress *)address{
    if(!gRootNavigationController){
        return;
    }
    UIViewController<FGViewControllerRouteProtocol>* targetVC = [FGViewControllerFactory viewControllerFromAddress:address];
    if(!targetVC){
        return;
    }
    if([targetVC respondsToSelector:@selector(routerHandleTranstionBySelfWithRootNavigationController:)]){
        //可以自己处理跳转
        [targetVC routerHandleTranstionBySelfWithRootNavigationController:gRootNavigationController];
        return;
    }
    FGViewControllerTransitionStyle transitionStyle = FGViewControllerTransitionStylePush;
    if([targetVC respondsToSelector:@selector(preferredTransitionStyleForUrlAddress:)]){
        transitionStyle = [targetVC preferredTransitionStyleForUrlAddress:address];
    }
    switch (transitionStyle) {
        case FGViewControllerTransitionStylePush:
            [gRootNavigationController pushViewController:targetVC animated:YES];
            break;
        case FGViewControllerTransitionStylePresent:
            [gRootNavigationController presentViewController:targetVC animated:YES completion:nil];
        case FGViewControllerTransitionStyleRootView:
            [gRootNavigationController setViewControllers:@[targetVC] animated:YES];
        default:
            break;
    }
}
+ (void)setRootNavigationController:(UINavigationController *)rootNavigationController{
    gRootNavigationController = rootNavigationController;
}
+ (UINavigationController *)rootNavigationController{
    return gRootNavigationController;
}
@end
