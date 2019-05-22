//
//  FGBaseViewController.h
//  
//
//  Created by ferrisxie on 2018/9/4.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGBaseViewController : UIViewController
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
@property (nonatomic,readonly) UIView* navigationbarBackgroundView;
/**
 保留一个对mainView的引用(承载主要内容的view)
 */
@property (nonatomic,weak) UIView* mainView;
/**
 空页面时需要展示的Tips，使用时需要指定{{mainView}}
 如果指定了{{mainView}}，hide的时候会显示mainView
 @param msg 消息内容
 @param title 按钮内容
 @param handler 事件
 @return EmptyView(不用手动addsubview了)
 */
-(void)showEmptyViewWithMessage:(NSString*)msg actionTitle:(NSString*)title actionHandler:(void(^)(void))handler;

-(void)hideEmptyViewWithAnimated:(BOOL)shouldAnimation;
/**
 @brief 刷新数据
 */
-(void)refreshData;

@end
