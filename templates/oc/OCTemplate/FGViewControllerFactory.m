//
//  FGViewControllerFactory.m
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGViewControllerFactory.h"
#import "FGRouteAddress.h"
#import "FGRoute.h"



@implementation FGViewControllerFactory
+ (UIViewController<FGViewControllerRouteProtocol> *)viewControllerFromURL:(NSString *)url{
    return [self viewControllerFromAddress:[[FGRouteAddress alloc] initWithString:url]];
}
+(UIViewController<FGViewControllerRouteProtocol> *)viewControllerFromAddress:(FGRouteAddress *)address{
    UIViewController<FGViewControllerRouteProtocol> * res;
    return res;
}
@end
