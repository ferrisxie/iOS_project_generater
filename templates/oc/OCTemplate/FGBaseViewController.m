//
//  FGBaseViewController.m
//  AmazingBuff
//
//  Created by ferrisxie on 2018/9/4.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "FGBaseViewController.h"
#define EmptyMsgViewTag  5710
#define EmptyActionBTTag  5710
#define LoadingViewTag  5710
#define UIColorNavigationBar [UIColor blackColor]
@interface FGBaseViewController ()
{
    UIView* _navigationbarBackgroundView;
}
@end

@implementation FGBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if(!self.shouldHideNavigationBar){
        [self.view bringSubviewToFront:self.navigationbarBackgroundView];
    }
    self.title = @"标题";
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(!self.shouldHideNavigationBar){
        [self.view bringSubviewToFront:self.navigationbarBackgroundView];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - Actions
- (void)showEmptyViewWithMessage:(NSString *)msg actionTitle:(NSString *)title actionHandler:(void (^)(void))handler{
    self.isEmpty = YES;
//    [self hideLoadingViewWithAnimated:NO];
//    [self hideOtherViewWithAnimated:NO];
    //监测是否存在
    UIView* exitView = [self.view viewWithTag:EmptyMsgViewTag];
    //隐藏mainView
    if(self.mainView)
    {
        self.mainView.hidden = YES;
    }
    if(exitView)
    {
        exitView.hidden = NO;
        return;
    }
    else{
        UILabel* emptyTitleView = [[UILabel alloc] init];
        emptyTitleView.text = msg;
        emptyTitleView.textAlignment = NSTextAlignmentCenter;
        emptyTitleView.textColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
        emptyTitleView.tag = EmptyMsgViewTag;
//        emptyTitleView.font = [MainFont fontWithSize:14];
        [self.view addSubview:emptyTitleView];
        
        UIButton* emptyAction = [UIButton buttonWithType:UIButtonTypeCustom];
        [emptyAction setTitle:title forState:UIControlStateNormal];
//        emptyAction.titleLabel.font = [MainFont fontWithSize:14];
        emptyAction.tag = EmptyActionBTTag;
        [emptyAction setTitleColor:UIColorFromRGB(0x3095FF) forState:UIControlStateNormal];
        [self.view addSubview:emptyAction];
        
        [emptyAction bk_addEventHandler:^(id sender) {
            if(handler)
            {
                handler();
            }
        } forControlEvents:UIControlEventTouchUpInside];
        [emptyAction mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.top.mas_equalTo(265);
            make.width.mas_equalTo(90);
            make.height.mas_equalTo(20);
        }];
        [emptyTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.mas_equalTo(emptyAction.mas_top).offset(-6);
            make.left.right.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
    }
}
-(void)hideEmptyViewWithAnimated:(BOOL)shouldAnimation
{
    self.isEmpty = NO;
    if(self.mainView)
    {
        self.mainView.hidden = NO;
    }
    UIView* emptyTitleView = [self.view viewWithTag:EmptyMsgViewTag];
    UIView* emptyActionView = [self.view viewWithTag:EmptyActionBTTag];
    if(emptyTitleView && emptyActionView)
    {
        if(shouldAnimation)
        {
            [UIView animateWithDuration:0.3f animations:^{
                emptyActionView.alpha = 0;
                emptyTitleView.alpha = 0;
            } completion:^(BOOL finished) {
                if(finished)
                {
//                    [self showOtherViewWithAnimated:shouldAnimation];
                    //销毁
                    [emptyActionView removeFromSuperview];
                    [emptyTitleView removeFromSuperview];
                }
            }];
        }else
        {
//            [self showOtherViewWithAnimated:shouldAnimation];
            [emptyActionView removeFromSuperview];
            [emptyTitleView removeFromSuperview];
        }
    }
}
- (void)refreshData{
}
#pragma mark - Setter & Getter
-(BOOL)isEmpty
{
    if(_isEmpty)
    {
        return YES;
    }
    //有子VC 递归调用
    if(self.childViewControllers)
    {
        for(UIViewController* vc in self.childViewControllers)
        {
            if([vc isKindOfClass:[FGBaseViewController class]])
            {
                //递归
                if([(FGBaseViewController*)vc isEmpty])
                {
                    return YES;
                }
            }
        }
    }
    return NO;
}
-(UIView *)navigationbarBackgroundView{
    if(_navigationbarBackgroundView){
        return _navigationbarBackgroundView;
    }
    _navigationbarBackgroundView = [[UIView alloc] init];
    [self.view addSubview:_navigationbarBackgroundView];
    [self.view bringSubviewToFront:_navigationbarBackgroundView];
    [_navigationbarBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(NAVBAR_HEIGHT);
    }];
    _navigationbarBackgroundView.backgroundColor = UIColorNavigationBar;
    return _navigationbarBackgroundView;
}

@end
