//
//  ImageTitleCell.m
//  Bike700
//
//  Created by HEYANG on 16/7/24.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "ImageTitleCell.h"

#define ImageTitleCell_Height 50
#define ImageTitleCell_HW 30

@interface ImageTitleCell ()

@property (nonatomic,weak)UIImageView *cellImageView;
@property (nonatomic,weak)UILabel *cellTitle;

@end

@implementation ImageTitleCell

/** 获取cell对象 */
+ (instancetype)cellWithTableView:(UITableView*)tableView {
    ImageTitleCell* cell = [tableView dequeueReusableCellWithIdentifier:ImageTitleCell_ID];
    if (cell == nil) {
        cell = [[ImageTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ImageTitleCell_ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self setUpView];
    }
    return self;
}
- (void)setUpView{
    self.backgroundColor = [UIColor whiteColor];
    
    // 添加图片
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(kPaddingLeftWidth, (ImageTitleCell_Height-ImageTitleCell_HW)*0.5, ImageTitleCell_HW, ImageTitleCell_HW);
    [imageView doCircleNoBorderFrame];
    [self addSubview:imageView];
    self.cellImageView = imageView;
    
    // 添加title
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(kPaddingLeftWidth*2+ImageTitleCell_HW, 0, 300, ImageTitleCell_Height);
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    [self addSubview:label];
    self.cellTitle = label;
    
    // 添加辅助边线
    UIView *lineView = [UIView new];
    lineView.frame = CGRectMake(0, ImageTitleCell_Height - 0.5, UIScreenWidth, 0.5);
    lineView.backgroundColor = CellSeparatorColor;
    [self addSubview:lineView];
}

- (void)setImage:(UIImage*)image title:(NSString*)title{
    self.cellImageView.image = image;
    self.cellTitle.text = title;
}

+ (CGFloat)cellHeight{
    return ImageTitleCell_Height;
}
@end
