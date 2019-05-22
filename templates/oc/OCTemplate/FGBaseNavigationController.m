//
//  FGBaseNavigationController.m
//  
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import "FGBaseNavigationController.h"

@interface FGBaseNavigationController () <UINavigationControllerDelegate>

@end

@implementation FGBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //原生导航栏背景色改为全透明
    self.navigationBar.translucent = YES;
    self.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationBar.clipsToBounds = YES;
    self.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationBar.backgroundColor = [UIColor clearColor];
    [self.navigationBar setShadowImage:[UIImage new]];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.delegate = self;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Appearance
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
-(BOOL)shouldAutorotate
{
    return [self.topViewController shouldAutorotate];
}
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return [self.topViewController supportedInterfaceOrientations];
}
#pragma mark - Gesture
-(UIGestureRecognizer *)popGesture
{
    return self.interactivePopGestureRecognizer;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
