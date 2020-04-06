//
//  FGBaseViewController.m
//  
//
//  Created by ferrisxie on 2018/9/4.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import "FGBaseViewController.h"
#define EmptyMsgViewTag  5710
#define EmptyActionBTTag  5710
#define LoadingViewTag  5710
#define UIColorNavigationBar [UIColor blackColor]
@interface FGBaseViewController ()
{
    UIView* _fakeNavigationBar;
    UILabel* _fakeTitleLabel;
    UIButton* _fakeBackButton;
    UILabel* _backButtonLabel;
    
    FGRouteAddress* _routeAddress;
    
    UITableView* _tableView;
}
@end

@implementation FGBaseViewController
- (instancetype)initFromFGAddress:(FGRouteAddress *)address{
    if(self = [super init]){
        _routeAddress = address;
    }
    return self;
}
-(FGRouteAddress *)routeAddress{
    return _routeAddress;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.shouldEnablePopGesture = YES;
    if(!self.shouldHideNavigationBar){
        [self.view bringSubviewToFront:self.fakeNavigationBar];
        [self setUpNavigationButtons];
    }
    self.title = @"标题";
    self.view.backgroundColor = UIColor.whiteColor;
    [FGLogTool addLog:[NSString stringWithFormat:@"viewDidLoad-%@",NSStringFromClass(self.class)] withLevel:FGLogLevelFatal];
}
-(void)setShouldHideNavigationBar:(BOOL)shouldHideNavigationBar{
    _shouldHideNavigationBar = shouldHideNavigationBar;
    _fakeNavigationBar.hidden = shouldHideNavigationBar;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if(!self.shouldHideNavigationBar){
        [self.view bringSubviewToFront:self.fakeNavigationBar];
    }
    [FGLogTool addLog:[NSString stringWithFormat:@"viewWillAppear-%@",NSStringFromClass(self.class)] withLevel:FGLogLevelFatal];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [FGLogTool addLog:[NSString stringWithFormat:@"viewDidAppear-%@",NSStringFromClass(self.class)] withLevel:FGLogLevelFatal];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)refreshData{
}
-(void)setUpNavigationButtons{

    _fakeTitleLabel = [[UILabel alloc] init];
    _fakeTitleLabel.textAlignment = NSTextAlignmentCenter;
    _fakeTitleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
    _fakeTitleLabel.textColor = UIColorFromRGB(0x333333);
    [_fakeNavigationBar addSubview:_fakeTitleLabel];
    [_fakeTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.centerY.mas_equalTo(BATTERY_HEIGHT / 2.0f);
    }];
    _fakeTitleLabel.hidden = YES;

    if(self.navigationController.viewControllers.count > 1){
        FGBaseButton* backButton = [[FGBaseButton alloc] init];
        UIImageView* backImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back"]];
        [backButton addSubview:backImgView];
        [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.size.mas_equalTo(CGSizeMake(12, 20));
            make.centerY.mas_equalTo(BATTERY_HEIGHT / 2.0f);
        }];
        
        UILabel* backButtonLabel = [UILabel new];
        backButtonLabel.textAlignment = NSTextAlignmentLeft;
        backButtonLabel.textColor = UIColorFromRGB(0x333333);
        backButtonLabel.font = [UIFont systemFontOfSize:14];
        [backButton addSubview:backButtonLabel];
        [backButtonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(backImgView.mas_right).offset(9);
            make.width.mas_equalTo(100);
            make.centerY.mas_equalTo(BATTERY_HEIGHT / 2.0f);
        }];
        _backButtonLabel = backButtonLabel;
        
        [_fakeNavigationBar addSubview:backButton];
        [backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(CGSizeMake(150, NAVBAR_HEIGHT));
        }];
        [backButton addTarget:self action:@selector(goback) forControlEvents:UIControlEventTouchUpInside];
        _fakeBackButton = backButton;
    }
}
-(void)goback{
    if(self.presentingViewController){
        [self dismissViewControllerAnimated:YES completion:nil];
    }else if(self.navigationController.viewControllers.count > 1){
        [self.navigationController popViewControllerAnimated:YES];
    }
}
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
-(void)setTitle:(NSString *)title{
    [super setTitle:title];
    _fakeTitleLabel.text = title;
    if(title && title.length > 0){
        _fakeTitleLabel.hidden = NO;
    }else{
        _fakeTitleLabel.hidden = YES;
    }
}
-(UIView *)fakeNavigationBar{
    if(_fakeNavigationBar){
        return _fakeNavigationBar;
    }
    _fakeNavigationBar = [[UIView alloc] init];
    [self.view addSubview:_fakeNavigationBar];
    [self.view bringSubviewToFront:_fakeNavigationBar];
    [_fakeNavigationBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
        make.height.mas_equalTo(NAVBAR_HEIGHT);
    }];
    _fakeNavigationBar.backgroundColor = UIColorNavigationBar;
    return _fakeNavigationBar;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NAVBAR_HEIGHT, screen_width, screen_height - NAVBAR_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.estimatedRowHeight = 0;
        _tableView.estimatedSectionFooterHeight = 0;
        _tableView.estimatedSectionHeaderHeight = 0;
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        if (@available(iOS 11.0, *)) {
            _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        } else {
            // Fallback on earlier versions
        }
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.contentInset = UIEdgeInsetsZero;
         self.automaticallyAdjustsScrollViewInsets = NO;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (void)setBackButtonTitle:(NSString *)backButtonTitle{
    _backButtonTitle = backButtonTitle;
    _backButtonLabel.text = backButtonTitle;
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskLandscape;
}
@end
