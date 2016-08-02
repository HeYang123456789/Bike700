//
//  HYNavItem.h
//  HYLibrary
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYItem.h"

/**
 *	@brief	导航栏标题数据项.
 */
@interface HYNavItem : HYItem{
@private
    NSString *_title;
    UIImage *_img;
    UIColor *_titleColor;
    UIFont *_titleFont;
}
/**
 *	@brief  标题.
 */
@property (nonatomic, copy) NSString *title;

/**
 *	@brief	图片.
 */
@property (nonatomic, strong) UIImage *img;

/**
 *	@brief	标题颜色, 默认[UIColor WhiteColor].
 */
@property (nonatomic, strong) UIColor *titleColor;

/**
 *	@brief	标题字体, 默认[UIFont systemFontOfSize:21.f].
 */
@property (nonatomic, strong) UIFont *titleFont;

/**
 *	@brief	logo 图片的摆放位置(偏移量)
 */
@property(nonatomic) CGFloat imgOffset;

/**
 *	@brief	HYNavItem初始化.
 *
 *	@param 	nTitle 	标题.
 *	@param 	nImg 	图片.
 *
 *	@return	HYNavItem实例.
 */
- (id)initWithTitle:(NSString *)nTitle img:(UIImage *)nImg;

/**
 *	@brief	HYNavItem初始化.
 *
 *	@param 	nTitle 	标题.
 *
 *	@return	HYNavItem实例.
 */
- (id)initWithTitle:(NSString *)nTitle;

/**
 *	@brief	HYNavItem初始化.
 *
 *	@param 	nImg 	图片.
 *
 *	@return	HYNavItem实例.
 */
- (id)initWithImg:(UIImage *)nImg;

@end
