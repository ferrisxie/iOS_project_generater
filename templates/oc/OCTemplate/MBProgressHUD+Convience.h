//
//  MBProgressHUD+Convience.h
//  WXTeacherBoard
//
//  Created by Ferris on 2020/3/3.
//  Copyright © 2020 100tal. All rights reserved.
//

#import "MBProgressHUD.h"

NS_ASSUME_NONNULL_BEGIN

@interface MBProgressHUD (Convience)
+(MBProgressHUD *)wxt_showLoading:(NSString *)text inView:(UIView*)view;
+(MBProgressHUD *)wxt_showLoading:(NSString *)text delay:(CGFloat)delay inView:(UIView*)view;
+(void)wxt_hideForView:(UIView *)view;
+ (MBProgressHUD *)wxt_showText:(NSString *)text delay:(CGFloat)delay;
+ (MBProgressHUD *)wxt_showText:(NSString *)text;
+ (MBProgressHUD *)wxt_showTextCenter:(NSString *)text delay:(CGFloat)delay;
+ (MBProgressHUD *)wxt_showTextCenter:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
