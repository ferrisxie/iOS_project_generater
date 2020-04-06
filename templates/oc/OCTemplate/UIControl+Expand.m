//
//  UIControl+Expand.m
//  FGeacherBoard
//
//  Created by Ferris on 2020/3/2.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "UIControl+Expand.h"
#import <objc/runtime.h>
#import "UIView+Convience.h"
static char associateLengthKey;
@implementation FGLargeFakeControl
-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView *hitView = [super hitTest:point withEvent:event];
    if([hitView isEqual:self] && !self.realControl.isHidden && self.realControl.alpha > 0)
    {
        return self.realControl;
    }else
    {
        return hitView;
    }
}
@end


@implementation UIControl (Expand)
- (FGLargeFakeControl *)fakeControl{
    return objc_getAssociatedObject(self, &associateLengthKey);
}
-(void)setFakeControl:(FGLargeFakeControl *)fakeControl
{
    objc_setAssociatedObject(self, &associateLengthKey, fakeControl, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(void)expandInteractaleAreaWithInset:(UIEdgeInsets)expandInset
{
    if(self.superview)
    {
        FGLargeFakeControl* fakeControl = [[FGLargeFakeControl alloc] init];
        fakeControl.backgroundColor = [UIColor clearColor];
        fakeControl.userInteractionEnabled = YES;
        fakeControl.realControl = self;
        [self.superview addSubview:fakeControl];
        [self.superview bringSubviewToFront:fakeControl];
        if(CGRectEqualToRect(CGRectZero, self.frame))
        {
            //自动布局
            [fakeControl mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(self.mas_left).offset(-expandInset.left);
                make.bottom.mas_equalTo(self.mas_bottom).offset(expandInset.bottom);
                make.right.mas_equalTo(self.mas_right).offset(expandInset.right);
                make.top.mas_equalTo(self.mas_top).offset(-expandInset.top);
            }];
            fakeControl.useAutolayout = YES;
        }else
        {
            //非自动布局
            fakeControl.frame = CGRectMake(self.left - expandInset.left, self.top - expandInset.top, self.width + expandInset.left + expandInset.right, self.height + expandInset.top + expandInset.bottom);
        }
        fakeControl.expandArea = UIEdgeInsetsMake(-expandInset.top, -expandInset.left, -expandInset.bottom, -expandInset.right);
        self.fakeControl = fakeControl;
    }else
    {
        //必须先添加到superView
        DebugLog(@"error:必须先添加到superView");
    }
}
- (void)reArrangedFakeControl{
    FGLargeFakeControl* fake = [self fakeControl];
    if(fake && !fake.useAutolayout){
        fake.frame = UIEdgeInsetsInsetRect(self.frame,fake.expandArea);
    }
}
@end
