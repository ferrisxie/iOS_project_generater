//
//  FGRefreshHeader.m
//  OCTemplate
//
//  Created by Ferris on 2020/4/6.
//  Copyright © 2020 localOrganization. All rights reserved.
//

#import "FGRefreshHeader.h"
@interface FGRefreshHeader()
@property (nonatomic, strong) UIImageView *loadingImageView;
@property (nonatomic, assign) CGFloat angle;
@end
@implementation FGRefreshHeader
- (void)placeSubviews
{
    [super placeSubviews];
    [self addSubview:self.loadingImageView];
    self.loadingImageView.center = CGPointMake(self.mj_w * 0.5, self.mj_h * 0.5);
}

- (void)setState:(MJRefreshState)state
{
    MJRefreshCheckState
    
    // 根据状态做事情
    if (state == MJRefreshStateIdle) {
        [self stopAnimation];
    } else if (state == MJRefreshStatePulling) {
        [self startAnimation];
    } else if (state == MJRefreshStateRefreshing) {

    }
}

- (UIImageView *)loadingImageView
{
    if (_loadingImageView == nil) {
        _loadingImageView = [[UIImageView alloc] init];
        _loadingImageView.mj_h = 20;
        _loadingImageView.mj_w = 20;
        _loadingImageView.image = [UIImage imageNamed:@"refresh_juhua"];
    }
    return _loadingImageView;
}

- (void)stopAnimation{
    [self.loadingImageView.layer removeAllAnimations];
}

//开始动画
- (void)startAnimation {
    NSLog(@"开始");
  [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
    self.loadingImageView.transform = CGAffineTransformRotate(self.loadingImageView.transform, M_PI_4);
  } completion:^(BOOL finished) {
    if (finished) {
        if (self.state == MJRefreshStateRefreshing || self.state == MJRefreshStatePulling) {
            [self startAnimation];
        }
    }
  }];
}
@end
