//
//  SelectionCell.h
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#define SelectionCell_ID @"SelectionCell_ID"

#import <UIKit/UIKit.h>
#import "SelectionModel.h"

@interface SelectionCell : UITableViewCell

/** 获取cell对象 */
+ (instancetype)cellWithTableView:(UITableView*)tableView;
/** 设置Cell */
- (void)setCellModel:(SelectionModel*)model;
/** Cell的行高  */
+ (CGFloat)cellHeight;

@end
