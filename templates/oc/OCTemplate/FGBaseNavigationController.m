//
//  FGBaseNavigationController.m
//  
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import "FGBaseNavigationController.h"

@interface FGBaseNavigationController () <UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation FGBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.translucent = YES;
    [self setNavigationBarHidden:YES];
    self.interactivePopGestureRecognizer.delegate = self;
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation
-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 1)
    {
        self.interactivePopGestureRecognizer.enabled = YES;
    }
    else
    {
        self.interactivePopGestureRecognizer.enabled = NO;
    }
}
#pragma mark - Appearance
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.topViewController preferredStatusBarStyle];
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

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count > 1) {
        return YES;
    }
    return NO;
}
@end
