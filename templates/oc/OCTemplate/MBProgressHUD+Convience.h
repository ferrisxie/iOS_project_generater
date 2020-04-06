//
//  MBProgressHUD+Convience.h
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (Convience)
+(MBProgressHUD *)FG_showLoading:(NSString *)text inView:(UIView*)view;
+(MBProgressHUD *)FG_showLoading:(NSString *)text delay:(CGFloat)delay inView:(UIView*)view;
+(void)FG_hideForView:(UIView *)view;
+ (MBProgressHUD *)FG_showText:(NSString *)text delay:(CGFloat)delay;
+ (MBProgressHUD *)FG_showText:(NSString *)text;
+ (MBProgressHUD *)FG_showTextCenter:(NSString *)text delay:(CGFloat)delay;
+ (MBProgressHUD *)FG_showTextCenter:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
