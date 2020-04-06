//
//  FGBaseButton.m
//  
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import "FGBaseButton.h"
#define DefaultMinAlpha 0.5
@implementation FGBaseButton
{
    NSMutableDictionary<NSNumber*,UIColor*>* _backgroundColorDic;
}
- (instancetype)init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _backgroundColorDic = [NSMutableDictionary dictionary];
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
-(void)setBackgroundColor:(UIColor *)backgroundColor{
    [super setBackgroundColor:backgroundColor];
    if(backgroundColor){
        [_backgroundColorDic setObject:backgroundColor forKey:@(UIControlStateNormal)];
    }
}
-(UIColor*)colorForState:(UIControlState)state{
    if([_backgroundColorDic objectForKey:@(state)]){
        return [_backgroundColorDic objectForKey:@(state)];
    }else{
        if([_backgroundColorDic objectForKey:@(UIControlStateNormal)]){
            return [_backgroundColorDic objectForKey:@(UIControlStateNormal)];
        }else{
            return nil;
        }
    }
}
-(void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state{
    if(backgroundColor){
        [_backgroundColorDic setObject:backgroundColor forKey:@(state)];
    }
}

@end
