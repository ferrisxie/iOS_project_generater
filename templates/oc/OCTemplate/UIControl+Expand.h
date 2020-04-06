//
//  UIControl+Expand.h
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/2.
//  Copyright © 2020 localOrganization. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FGLargeFakeControl : UIControl
@property (nonatomic,weak) UIControl* realControl;
@property (nonatomic, assign) BOOL useAutolayout;
@property (nonatomic, assign) UIEdgeInsets expandArea;
@end

@interface UIControl (Expand)

@property (nonatomic, weak) FGLargeFakeControl* fakeControl;
/**
 扩大按钮响应区域

 @param expandInset 需要扩大的边缘值 全部都是正数10，10，10，10
 */
-(void)expandInteractaleAreaWithInset:(UIEdgeInsets)expandInset;
-(void)reArrangedFakeControl;
@end

NS_ASSUME_NONNULL_END
