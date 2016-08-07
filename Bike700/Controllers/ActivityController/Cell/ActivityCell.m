//
//  ActivityCell.m
//  Bike700
//
//  Created by HEYANG on 16/8/5.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "ActivityCell.h"
// 图片背景View的高度
#define ImageViewBgHeight (UIScreenWidth*0.6)
// 文本View的高度
#define TextViewBgHeight (UIScreenWidth*0.133)

// title左右两边的边距
#define TitlePaddingWidth 22
#define TitleHeight 21

// text上下两边的边距
#define TitleTopBottomPadding 8
// text左右两边的边距
#define TitleLeftRightPadding 10

// 底部阴影的高度
#define BottomViewHeight 10

@interface ActivityCell ()

@property (nonatomic,weak)UIImageView *imageBgiew;
@property (nonatomic,weak)UIView *maskView;
@property (nonatomic,weak)UILabel *titleLabel;

@property (nonatomic,weak)UIView *textView;

@property (nonatomic,weak)UILabel *targetAdressTitle;
@property (nonatomic,weak)UILabel *targetAdressValue;
@property (nonatomic,weak)UILabel *pricePrizeTitle;
@property (nonatomic,weak)UILabel *pricePrizeValue;
@property (nonatomic,weak)UILabel *activityStatusTitle;
@property (nonatomic,weak)UILabel *activityStatusValue;

@property (nonatomic,weak)UIView *bottomView;

@end

@implementation ActivityCell


+ (instancetype)cellWithTableView:(UITableView*)tableView {
    ActivityCell* cell = [tableView dequeueReusableCellWithIdentifier:ActivityCell_ID];
    if (cell == nil) {
        cell = [[ActivityCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ActivityCell_ID];
    }
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle= UITableViewCellSelectionStyleNone;
        
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
    
    // 文本View
    UIView* textView = [[UIView alloc] initWithFrame:CGRectMake(0, ImageViewBgHeight, UIScreenWidth, TextViewBgHeight)];
    [self addSubview:textView];
    self.textView = textView;
    
    // 下面是6个Label
    UILabel *targetAdressTitle = [UILabel new];
    targetAdressTitle.font = [UIFont systemFontOfSize:11];
    targetAdressTitle.frame = CGRectMake(TitleLeftRightPadding, TitleTopBottomPadding, (UIScreenWidth/3)-2*TitleLeftRightPadding, TextViewBgHeight*0.5-TitleTopBottomPadding);
    targetAdressTitle.textAlignment = NSTextAlignmentCenter;
    targetAdressTitle.textColor = ActivityTitleColor;
    [self.textView addSubview:targetAdressTitle];
    self.targetAdressTitle = targetAdressTitle;
    
    
    UILabel *pricePrizeTitle = [UILabel new];
    pricePrizeTitle.font = [UIFont systemFontOfSize:11];
    pricePrizeTitle.frame = CGRectMake((UIScreenWidth/3)+TitleLeftRightPadding, TitleTopBottomPadding, (UIScreenWidth/3)-2*TitleLeftRightPadding, TextViewBgHeight*0.5-TitleTopBottomPadding);
    pricePrizeTitle.textAlignment = NSTextAlignmentCenter;
    pricePrizeTitle.textColor = ActivityTitleColor;
    [self.textView addSubview:pricePrizeTitle];
    self.pricePrizeTitle = pricePrizeTitle;
    
    UILabel *activityStatusTitle = [UILabel new];
    activityStatusTitle.font = [UIFont systemFontOfSize:11];
    activityStatusTitle.frame = CGRectMake((UIScreenWidth/3)*2+TitleLeftRightPadding, TitleTopBottomPadding, (UIScreenWidth/3)-2*TitleLeftRightPadding, TextViewBgHeight*0.5-TitleTopBottomPadding);
    activityStatusTitle.textAlignment = NSTextAlignmentCenter;
    activityStatusTitle.textColor = ActivityTitleColor;
    [self.textView addSubview:activityStatusTitle];
    self.activityStatusTitle = activityStatusTitle;
    
    UILabel *targetAdressValue = [UILabel new];
    targetAdressValue.font = [UIFont systemFontOfSize:12];
    targetAdressValue.frame = CGRectMake(TitleLeftRightPadding,TextViewBgHeight * 0.5, (UIScreenWidth/3)-2*TitleLeftRightPadding, TextViewBgHeight*0.5-TitleTopBottomPadding);
    targetAdressValue.textAlignment = NSTextAlignmentCenter;
    [self.textView addSubview:targetAdressValue];
    self.targetAdressValue = targetAdressValue;
    
    UILabel *pricePrizeValue = [UILabel new];
    pricePrizeValue.font = [UIFont systemFontOfSize:12];
    pricePrizeValue.frame = CGRectMake((UIScreenWidth/3)+TitleLeftRightPadding, TextViewBgHeight * 0.5, (UIScreenWidth/3)-2*TitleLeftRightPadding, TextViewBgHeight*0.5-TitleTopBottomPadding);
    pricePrizeValue.textAlignment = NSTextAlignmentCenter;
    [self.textView addSubview:pricePrizeValue];
    self.pricePrizeValue = pricePrizeValue;
    
    UILabel *activityStatusValue = [UILabel new];
    activityStatusValue.font = [UIFont systemFontOfSize:12];
    activityStatusValue.frame = CGRectMake((UIScreenWidth/3)*2+TitleLeftRightPadding, TextViewBgHeight * 0.5, (UIScreenWidth/3)-2*TitleLeftRightPadding, TextViewBgHeight*0.5-TitleTopBottomPadding);
    activityStatusValue.textAlignment = NSTextAlignmentCenter;
    [self.textView addSubview:activityStatusValue];
    self.activityStatusValue = activityStatusValue;
    
    // 测试UI
//    self.targetAdressTitle.text = @"第一个";
//    self.pricePrizeTitle.text = @"第二个";
//    self.activityStatusTitle.text = @"第三个";
//    self.targetAdressValue.text = @"第四个";
//    self.pricePrizeValue.text = @"第五个";
//    self.activityStatusValue.text = @"第六个";

    
    // 底部View
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ImageViewBgHeight+TextViewBgHeight, UIScreenWidth, BottomViewHeight)];
    bottomView.backgroundColor = CellBottomViewColor;
    [self addSubview:bottomView];
    self.bottomView = bottomView;
}


- (void)setCellModel:(ActivityModel*)model{
    // 背景图片
    [self.imageBgiew requestImageWithURLStr:model.coverPic];
    // title
    self.titleLabel.text = model.activityName;
    
    // 目标和地址
    if (model.target>0) {
        // 有目标
        self.targetAdressTitle.text = @"目标";
        self.targetAdressValue.text = [NSString stringWithFormat:@"%ld",(long)model.target];
    }else{
        self.targetAdressTitle.text = @"地址";
        self.targetAdressValue.text = model.address;
    }
    
    // 奖励或者费用
    if (![model.prize isEqualToString:@""]) {
        self.pricePrizeTitle.text = @"奖励";
        self.pricePrizeValue.text = model.prize;
    }else{
        self.pricePrizeTitle.text = @"费用";
        self.pricePrizeValue.text = model.price;
    }
    
    // 状态和状态值
    self.activityStatusTitle.text = @"状态";
    NSString *statusValue;
    switch (model.activityStatus) {
        case 1:
            statusValue = @"报名进行中";
            break;
        case 2:
            statusValue = @"活动进行中";
            break;
        case 3:
            statusValue = @"活动已结束";
            break;
        case 4:
            statusValue = @"报名已截止";
            break;
        default:
            statusValue = @"活动正安排";
            break;
    }
    self.activityStatusValue.text = statusValue;
    
}

- (void)layoutSubviews{
    // 调整布局
//    [self.tagNameLabel sizeToFit];
//    self.tagNameLabel.center = self.titleLabel.center;
//    self.tagNameLabel.y = (ImageViewBgHeight+TitleHeight)*0.5;
    
//    [self.dateLabel sizeToFit];
//    self.dateLabel.centerX = self.textView.centerX;
//    self.dateLabel.centerY = TextViewBgHeight*0.5;
}

+ (CGFloat)cellHeight{
    return (ImageViewBgHeight+TextViewBgHeight+BottomViewHeight);
}

@end
