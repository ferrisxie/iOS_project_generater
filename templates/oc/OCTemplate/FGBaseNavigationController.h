//
//  FGBaseNavigationController.h
//  
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGBaseNavigationController : UINavigationController
@property(nonatomic,strong,readonly) UIGestureRecognizer* popGesture;
@end
