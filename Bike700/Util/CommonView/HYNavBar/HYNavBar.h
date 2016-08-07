//
//  HYNavBar.h
//  HYLibrary
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYView.h"
#import "HYBarButton.h"
#import "HYNavItem.h"
#import "HYBarButtonItem.h"

/**
 *	@brief	导航视图.
 */
@interface HYNavBar : HYView{
    
@private
    HYBarButtonItem *_leftBarButtonItem;
    HYBarButtonItem *_rightBarButtonItem;
    HYNavItem *_topItem;
    UIImage *_bgImg;
    UIView *_shadowView;
    
@protected
    UIImageView *_bgView;
    
    HYBarButton *_leftBarButton;
    HYBarButton *_rightBarButton;
    
    HYView *_topView;
    UIImageView *_topImageView;
    UILabel *_topTitleView;
}
/**
 *	@brief	左导航按钮数据项.
 */
@property (nonatomic, strong) HYBarButtonItem *leftBarButtonItem;

/**
 *	@brief	右导航按钮数据项.
 */
@property (nonatomic, strong) HYBarButtonItem *rightBarButtonItem;

/**
 *	@brief	标题数据项.
 */
@property (nonatomic, strong) HYNavItem *topItem;

/**
 *	@brief	背景图片.
 */
@property (nonatomic, strong) UIImage *bgImg;

/**
 *	@brief 设置标题栏logo图片.
 */
-(void)setLogoImgView:(CGFloat)heithOffset;
@end
