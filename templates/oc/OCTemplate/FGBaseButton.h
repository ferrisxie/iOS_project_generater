//
//  FGBaseButton.h
//  
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 localOrganization. All rights reserved.
//  基本按钮，带有点击态，从MttAlphaButton移植

#import <UIKit/UIKit.h>

@interface FGBaseButton : UIButton
@property (nonatomic, assign) CGFloat minAlpha;
@property (nonatomic, assign) CGFloat horizontalMargin;
@property (nonatomic, assign) CGFloat bottomMargin;
@end
