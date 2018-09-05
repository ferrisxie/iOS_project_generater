//
//  FGBaseButton.m
//  AmazingBuff
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 Tencent. All rights reserved.
//

#import "FGBaseButton.h"
#define DefaultMinAlpha 0.5
@implementation FGBaseButton

- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    [self commonInit];
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    [self commonInit];
    return self;
}

- (void)commonInit
{
    _minAlpha = DefaultMinAlpha;
    [self addTarget:self action:@selector(alphaTouchDown:) forControlEvents:UIControlEventTouchDown];
    [self addTarget:self action:@selector(alphaTouchUp:) forControlEvents:UIControlEventTouchUpInside];
    [self addTarget:self action:@selector(alphaTouchUp:) forControlEvents:UIControlEventTouchUpOutside];
}

- (void)alphaTouchDown:(id)sender
{
    self.alpha = _minAlpha;
}

- (void)alphaTouchUp:(id)sender
{
    self.alpha = 1;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if(self.highlighted) {
        [self setAlpha:_minAlpha];
    }
    else {
        [self setAlpha:1.0];
    }
}

//- (void)positionToFit
//{
//    [super positionToFit];
//    CGRect frame = self.frame;
//    if (self.position == MttBarButtonPositionLeft && _horizontalMargin>0) {
//        frame.origin.x = _horizontalMargin;
//    }
//    else if (self.position == MttBarButtonPositionRight && _horizontalMargin>0) {
//        frame.origin.x = self.superview.bounds.size.width - _horizontalMargin - frame.size.width;
//    }
//    else if (self.position == MttBarButtonPositionSecondRight && _horizontalMargin>0) {
//        frame.origin.x = self.superview.bounds.size.width - _horizontalMargin - frame.size.width * 2;
//    }
//    if (_bottomMargin>0) {
//        frame.origin.y = self.superview.bounds.size.height - _bottomMargin - frame.size.height;
//    }
//    self.frame = frame;
//}

@end
