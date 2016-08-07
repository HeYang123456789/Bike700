//
//  ImageNameSexLocalCell.m
//  Bike700
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "ImageNameSexLocalCell.h"

#define ImageNameSexLocalCell_Height 80
#define ImageNameSexLocalCell_HW 50

// name和sex local两个label距离上面和下面的边距
#define NameSexLocal_Padding 10

@interface ImageNameSexLocalCell ()

@property (nonatomic,weak)UIImageView *avatarImageView;
@property (nonatomic,weak)UILabel *nameLabel;
@property (nonatomic,weak)UILabel *sexAndLocalLabel;
//@property (nonatomic,weak)UILabel *localLabel;

@end

@implementation ImageNameSexLocalCell

/** 获取cell对象 */
+ (instancetype)cellWithTableView:(UITableView*)tableView {
    ImageNameSexLocalCell* cell = [tableView dequeueReusableCellWithIdentifier:ImageNameSexLocalCell_ID];
    if (cell == nil) {
        cell = [[ImageNameSexLocalCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ImageNameSexLocalCell_ID];
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
    
    // 大头像垂直居中，(15,x,x,x)，宽高50
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(kPaddingLeftWidth, (ImageNameSexLocalCell_Height-ImageNameSexLocalCell_HW)*0.5, ImageNameSexLocalCell_HW, ImageNameSexLocalCell_HW);
    [imageView doCircleNoBorderFrame];// 圆边处理
    [self addSubview:imageView];
    self.avatarImageView = imageView;
    
    // 名字Label
    UILabel *nameLabel = [UILabel new];
    nameLabel.frame = CGRectMake(kPaddingLeftWidth*2+ImageNameSexLocalCell_HW, NameSexLocal_Padding, 300, ImageNameSexLocalCell_Height*0.5 - NameSexLocal_Padding);
    [nameLabel setFont:[UIFont boldSystemFontOfSize:18]];
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    // 性别+地址的Label
    UILabel *sexAndLocalLabel = [UILabel new];
    sexAndLocalLabel.frame = CGRectMake(kPaddingLeftWidth*2+ImageNameSexLocalCell_HW, ImageNameSexLocalCell_Height*0.5, 300, ImageNameSexLocalCell_Height*0.5 - NameSexLocal_Padding);
    [sexAndLocalLabel setFont:[UIFont systemFontOfSize:14]];
    [self addSubview:sexAndLocalLabel];
    self.sexAndLocalLabel = sexAndLocalLabel;
    
}

/** 设置Cell */
- (void)setCellModel:(UserInfo*)model{
    
    if (model) {
        [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[User placeHolderHeadImage]];
        if (model.nickname) {
            self.nameLabel.text = model.nickname;
        }
        if (model.gender) {
            NSString *sexStr = [model.gender isEqualToString:@"M"]?@"男":@"女";
            NSString *str = [NSString stringWithFormat:@"%@ %@ %@",sexStr,model.province,model.city];
            self.sexAndLocalLabel.text = str;
        }
    }
}


+ (CGFloat)cellHeight{
    return ImageNameSexLocalCell_Height;
}
@end
