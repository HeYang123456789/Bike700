//
//  MainTabBarController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//


#import "HYBarItem.h"
/**
 *	@brief	Bar按钮样式.
 */
typedef NS_ENUM(NSInteger, HYBarButtonItemStyle){
    /*!
     *  @brief  普通方形带边框按钮
     */
    HYBarButtonItemStyleBordered,
    /*!
     *  @brief  返回按钮样式
     */
    HYBarButtonItemStyleBack,
    /*!
     *  @brief  自定义视图按钮
     */
    HYBarButtonItemStyleCustom,
};

/**
 *	@brief	Bar按钮数据项.
 */
@interface HYBarButtonItem : HYBarItem{
    @private
    SEL _action;
    id __weak _target;
    HYBarButtonItemStyle _style;
    UIView *_customView;
}
/**
 *	@brief	动作.
 */
@property (nonatomic) SEL action;

/**
 *	@brief	动作源对象.
 */
@property (nonatomic, weak) id target;

/**
 *	@brief	按钮样式.
 */
@property (nonatomic) HYBarButtonItemStyle style;

/**
 *	@brief	自定义视图.
 */
@property (nonatomic, strong) UIView *customView;

/**
 *	@brief	Bar按钮数据项.
 *
 *	@param 	nTitle      按钮标题.
 *	@param 	nTarget 	按钮动作源对象.
 *	@param 	nAction     按钮动作.
 *
 *	@return	Bordered按钮.
 */
- (id)initWithTitle:(NSString *)nTitle target:(id)nTarget action:(SEL)nAction;

/**
 *	@brief	Bar按钮数据项.
 *
 *	@param 	nTarget 	按钮动作源对象.
 *	@param 	nAction 	按钮动作.
 *
 *	@return	Back按钮.
 */
- (id)initBackWithTarget:(id)nTarget action:(SEL)nAction;

/**
 *	@brief	Bar按钮数据项.
 *
 *	@param 	nCustomView 	自定义按钮视图.
 *
 *	@return	Custom按钮.
 */
- (id)initWithCustomView:(UIView *)nCustomView;

/**
 *	@brief	默认border图片, 默认nil.
 *
 *	@return	UIImage数组, (borderImage,borderImageHighlight).
 */
- (NSArray *)borderImages;

/**
 *	@brief	默认back按钮图片, 默认nil.
 *
 *	@return	UIImage数组, (borderImage,borderImageHighlight).
 */
- (NSArray *)backImages;

@end
