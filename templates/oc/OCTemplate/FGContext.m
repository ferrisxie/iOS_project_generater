//
//  FGContext.m
//  OCTemplate
//
//  Created by Ferris on 2020/4/6.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGContext.h"

@implementation FGContext
DEF_SINGLETON(FGContext)

- (void)loadRouteUrl:(NSString *)url{
    [FGRoute loadUrl:url];
}
- (UINavigationController *)rootNavigationController{
    return [FGRoute rootNavigationController];
}
- (BOOL)isDebugEnv{
    return YES;
}
@end
