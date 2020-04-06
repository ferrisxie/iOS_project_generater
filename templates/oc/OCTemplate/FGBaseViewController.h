//
//  FGBaseViewController.h
//  
//
//  Created by ferrisxie on 2018/9/4.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FGRoute.h"
@interface FGBaseViewController : UIViewController<FGViewControllerRouteProtocol>
- (instancetype)initFromFGAddress:(FGRouteAddress *)address;

@property (nonatomic, strong) NSString* backButtonTitle;
@property (nonatomic, readonly) FGRouteAddress* routeAddress;
/**
 是否隐藏导航栏，默认为NO。
 */
@property (nonatomic,assign) BOOL shouldHideNavigationBar;
/**
 是否为空页面 - 如果显示了EmptyView则为空页面（如果子vc为空，该页面也为空）
 */
@property (nonatomic,assign) BOOL isEmpty;
/**
 导航栏，默认背景色，需要半透明的页面自己处理
 */
@property (nonatomic,readonly) UIView* fakeNavigationBar;
/**
 保留一个对mainView的引用(承载主要内容的view)
 */
@property (nonatomic,weak) UIView* mainView;
/**
 @brief 刷新数据
 */
-(void)refreshData;
-(void)goback;
@property (nonatomic, readonly) UITableView* tableView;

@property (nonatomic, assign) BOOL shouldEnablePopGesture;
@end
