//
//  ActivityCell.h
//  Bike700
//
//  Created by HEYANG on 16/8/5.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#define ActivityCell_ID @"ActivityCell_ID"

#import <UIKit/UIKit.h>
#import "ActivityModel.h"

@interface ActivityCell : UITableViewCell

/** 获取cell对象 */
+ (instancetype)cellWithTableView:(UITableView*)tableView;
/** 设置Cell */
- (void)setCellModel:(ActivityModel*)model;
/** Cell的行高  */
+ (CGFloat)cellHeight;

@end
