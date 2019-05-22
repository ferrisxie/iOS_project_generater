//
//  FGBaseTableViewCell.m
//  
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import "FGBaseTableViewCell.h"

@implementation FGBaseTableViewCell

+(NSString *)reuseIdentify
{
    return NSStringFromClass(self);
}
-(void)setUpWithModel:(id)model
{
    NSAssert(NO, @"Subclass must override this method.");
}
-(id)model
{
    NSAssert(NO, @"Subclass must override this method.");
    return nil;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
    }
    return self;
}

@end
