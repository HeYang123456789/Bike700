//
//  ImageTitleCell.h
//  Bike700
//
//  Created by HEYANG on 16/7/24.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#define ImageTitleCell_ID @"ImageTitleCell_ID"

#import <UIKit/UIKit.h>

@interface ImageTitleCell : UITableViewCell

/** 获取cell对象 */
+ (instancetype)cellWithTableView:(UITableView*)tableView;

- (void)setImage:(UIImage*)image title:(NSString*)title;
/** Cell的高度 */
+ (CGFloat)cellHeight;

@end
