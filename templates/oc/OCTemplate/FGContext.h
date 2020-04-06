//
//  FGContext.h
//  OCTemplate
//
//  Created by Ferris on 2020/4/6.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGContext : NSObject
AS_SINGLETON(FGContext)

//@property (nonatomic, weak) FGTabarViewController* rootTabbarViewController;

- (UINavigationController*)rootNavigationController;

- (void)loadRouteUrl:(NSString*)url;

@property (nonatomic, assign) BOOL isDebugEnv; //是否测试环境
@end

NS_ASSUME_NONNULL_END
