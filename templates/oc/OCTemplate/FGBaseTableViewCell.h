//
//  FGBaseTableViewCell.h
//  
//
//  Created by ferrisxie on 2018/9/5.
//  Copyright © 2018年 localOrganization. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FGBaseTableViewCell : UITableViewCell
@property(nonatomic,strong) id model;
//保留对TableView的弱引用
@property (nonatomic,weak) UITableView* tableView;
/**
 是否已经setup过
 */
@property (nonatomic,assign) BOOL didSetUp;

+ (NSString*)reuseIdentify;
- (id)model;
- (void)setUpWithModel:(id)model;
@end
