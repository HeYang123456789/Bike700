//
//  MainTabBarController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYView.h"
#import "HYBarButtonItem.h"

@class HYBarButtonItem;
/**
 *	@brief	导航按钮视图.
 */
@interface HYBarButton : HYView{
    @private
    HYBarButtonItem *_item;
    UIEdgeInsets _textInset;
    @protected
    
}
/**
 *	@brief	导航按钮数据项.
 */
@property (nonatomic, strong) HYBarButtonItem *item;

/**
 *	@brief	标题内填充.
 */
@property (nonatomic, assign) UIEdgeInsets textInset;
/**
 *	@brief	图片内填充.
 */
@property (nonatomic, assign) UIEdgeInsets imageInset;

/**
 *	@brief	按钮
 */
@property (nonatomic,strong) UIButton *barButton;

/**
 *	@brief	HYBarButton初始化.
 *
 *	@param 	item 	数据项.
 *
 *	@return	HYBarButton实例.
 */
- (id)initWithItem:(HYBarButtonItem *)item;

@end
