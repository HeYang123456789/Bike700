//
//  ImageNameSexLocalCell.h
//  Bike700
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#define ImageNameSexLocalCell_ID @"ImageNameSexLocalCell_ID"

#import <UIKit/UIKit.h>

// 这个Cell依赖用户模型User
#import "User.h"

@interface ImageNameSexLocalCell : UITableViewCell

/** 获取cell对象 */
+ (instancetype)cellWithTableView:(UITableView*)tableView;
/** 设置Cell */
- (void)setCellModel:(UserInfo*)model;
/** Cell的高度 */
+ (CGFloat)cellHeight;

@end
