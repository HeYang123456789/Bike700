//
//  SelectionCell.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "SelectionCell.h"

// 图片背景View的高度
#define ImageViewBgHeight (UIScreenWidth*0.6)
// 文本View的高度
#define TextViewBgHeight (UIScreenWidth*0.12)

// title左右两边的边距
#define TitlePaddingWidth 22
#define TitleHeight 21

@interface SelectionCell ()

@property (nonatomic,weak)UIImageView *imageBgiew;
@property (nonatomic,weak)UIView *maskView;
@property (nonatomic,weak)UILabel *titleLabel;
@property (nonatomic,weak)UILabel *tagNameLabel;

@property (nonatomic,weak)UIView *textView;
@property (nonatomic,weak)UILabel *dateLabel;
@end

@implementation SelectionCell


+ (instancetype)cellWithTableView:(UITableView*)tableView {
    SelectionCell* cell = [tableView dequeueReusableCellWithIdentifier:SelectionCell_ID];
    if (cell == nil) {
        cell = [[SelectionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SelectionCell_ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle=UITableViewCellSelectionStyleNone;
        
        [self setUpView ];
    }
    return self;
}

- (void)setUpView{
    
    // 图片View
    UIImageView* imageBgiew = [[UIImageView alloc] \
        initWithFrame:CGRectMake(0, 0, UIScreenWidth, ImageViewBgHeight)];
    imageBgiew.backgroundColor = [UIColor whiteColor];
    [self addSubview:imageBgiew];
    self.imageBgiew = imageBgiew;
    
    // maskView
    UIView *maskView = [UIView new];
    maskView.frame = self.imageBgiew.bounds;
    maskView.backgroundColor = CellMaskViewColor;
    [self.imageBgiew addSubview:maskView];
    self.maskView = maskView;
    
    // title
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(TitlePaddingWidth, (ImageViewBgHeight-TitleHeight)*0.5, UIScreenWidth - 2*TitlePaddingWidth, TitleHeight);
    [titleLabel setTextColor:[UIColor whiteColor]];
    [titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.imageBgiew addSubview:titleLabel];
    self.titleLabel = titleLabel;
    //tagNameLabel
    UILabel *tagNameLabel = [UILabel new];
    tagNameLabel.textColor=[UIColor whiteColor];
    tagNameLabel.font=[UIFont systemFontOfSize:11];
    [self.imageBgiew addSubview:tagNameLabel];
    self.tagNameLabel = tagNameLabel;
    
    
    // 文本View
    UIView* textView = [[UIView alloc] initWithFrame:CGRectMake(0, ImageViewBgHeight, UIScreenWidth, TextViewBgHeight)];
    [self addSubview:textView];
    self.textView = textView;
    // dateLabel
    UILabel *dateLabel = [UILabel new];
    dateLabel.textColor = CellTagNameLabelColor;
    dateLabel.font=[UIFont systemFontOfSize:12];
    [self.textView addSubview:dateLabel];
    self.dateLabel = dateLabel;
}


- (void)setCellModel:(SelectionModel*)model{
    
    SelectionModelList *list = model.list;
    // 背景图片
    [self.imageBgiew requestImageWithURLStr:list.pic];
    // title
    self.titleLabel.text = list.title;
    // tagNameLabel
    self.tagNameLabel.text = [NSString stringWithFormat:@"#%@",list.tagName];
    // dateLabel
    self.dateLabel.text = model.date;
    
}

- (void)layoutSubviews{
    // 调整布局
    [self.tagNameLabel sizeToFit];
    self.tagNameLabel.center = self.titleLabel.center;
    self.tagNameLabel.y = (ImageViewBgHeight+TitleHeight)*0.5;
    
    [self.dateLabel sizeToFit];
    self.dateLabel.centerX = self.textView.centerX;
    self.dateLabel.centerY = TextViewBgHeight*0.5;
    
}

+ (CGFloat)cellHeight{
    return (ImageViewBgHeight+TextViewBgHeight);
}


@end
