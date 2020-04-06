//
//  MBProgressHUD+Convience.m
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "MBProgressHUD+Convience.h"

#import "NSObject+Convience.h"


@implementation MBProgressHUD (Convience)
+(MBProgressHUD *)FG_showLoading:(NSString *)text delay:(CGFloat)delay inView:(UIView*)view;
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    [hud showAnimated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.userInteractionEnabled = YES;
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}
+(MBProgressHUD *)FG_showLoading:(NSString *)text inView:(UIView*)view;
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    [UIActivityIndicatorView appearanceWhenContainedInInstancesOfClasses:@[[MBProgressHUD class]]].color = [UIColor whiteColor];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    hud.mode = MBProgressHUDModeIndeterminate;
//    hud.userInteractionEnabled = YES;
    hud.label.text = text;
    return hud;
}
+(void)FG_hideForView:(UIView *)view{
    [NSObject runBlockInMainThreadFastestLoop:^{
        [MBProgressHUD hideHUDForView:view animated:YES];
    }];
}
+ (MBProgressHUD *)FG_showText:(NSString *)text delay:(CGFloat)delay {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:FG_KEYWINDOW];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:FG_KEYWINDOW animated:YES];
    }
    hud.margin = 16;
    hud.offset = CGPointMake(0, screen_height/2-91.5);
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = [UIColor clearColor];
//    hud.bezelView.layer.masksToBounds = YES;
//    hud.bezelView.layer.cornerRadius = 1;
    UIView* backgroundView = [[UIView alloc] init];
    [hud.bezelView insertSubview:backgroundView atIndex:0];
    backgroundView.backgroundColor = UIColorFromRGB(0x001111);
    backgroundView.layer.masksToBounds = YES;
    backgroundView.layer.cornerRadius = 1;
    //[backgroundView addBlurEffect:UIBlurEffectStyleExtraLight];
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(8);
        make.bottom.mas_equalTo(-9);
    }];

    hud.mode = MBProgressHUDModeText;
    hud.label.font = [MainFont fontWithSize:12];
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = text;;
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}

+ (MBProgressHUD *)FG_showTextCenter:(NSString *)text delay:(CGFloat)delay {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:FG_KEYWINDOW];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:FG_KEYWINDOW animated:YES];
    }
    hud.margin = 7;
//    hud.offset = CGPointMake(0, screen_height/2-91.5);
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = UIColorFromRGB(0x001111);
    hud.bezelView.layer.masksToBounds = YES;
    hud.bezelView.layer.cornerRadius = 1;
    hud.mode = MBProgressHUDModeText;
    hud.label.font = [MainFont fontWithSize:12];
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = text;;
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}
+(MBProgressHUD*)FG_showText:(NSString*)text inView:(UIView*)view delay:(CGFloat)delay
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    }
    hud.margin = 7;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.color = UIColorFromRGB(0x001111);
    hud.bezelView.layer.masksToBounds = YES;
    hud.bezelView.layer.cornerRadius = 1;
    hud.mode = MBProgressHUDModeText;
    hud.label.font = [MainFont fontWithSize:12];
    hud.label.textColor = [UIColor whiteColor];
    hud.label.text = text;
    [hud hideAnimated:YES afterDelay:delay];
    return hud;
}
+ (MBProgressHUD *)FG_showText:(NSString *)text {
    return [self FG_showText:text delay:1];
}

+(MBProgressHUD *)FG_showTextCenter:(NSString *)text {
    return [self FG_showTextCenter:text delay:1];
}

@end
