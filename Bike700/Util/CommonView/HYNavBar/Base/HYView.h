//
//  HYView.h
//  NavigationBar
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *	@brief  View基类, 默认无背景色.
 */
@interface HYView : UIView{
@private
    id _userinfo;
    UIEdgeInsets _inset;
}
@property (weak, nonatomic) UIView *receiver;
/**
 *	@brief	自定义数据.
 */
@property (nonatomic, strong) id userinfo;

/**
 *	@brief  内填充 ,默认UIEdgeInsetsZero.
 */
@property (nonatomic, assign) UIEdgeInsets inset;


#pragma mark - 显示边框的公开的方法
/**
 *	@brief	显示黑色边框.
 */
- (void)borderShow;

/**
 *	@brief	显示边框.
 *
 *	@param 	broderColor 	边框颜色.
 */
- (void)borderShow:(UIColor *)broderColor;

/**
 *	@brief	显示边框.
 *
 *	@param 	broderColor 	边框颜色.
 *	@param 	borderWidth 	边框宽度.
 */
- (void)borderShow:(UIColor *)broderColor width:(CGFloat)borderWidth;

@end
