//
//  RootViewController.h
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HYNavBar.h"

@interface RootViewController : UIViewController

/**
 *	@brief	自定义导航条
 */
@property(nonatomic,strong)HYNavBar *navBar;

/**
 *	@brief	自定义导航条高度
 */
@property (nonatomic, assign) CGFloat navHeight;

/**
 *	@brief	标题栏的logo图片，如果有标题的话则此图片隐藏
 */
@property(nonatomic,strong)UIImage *navLogoImg;
/**
 *	@brief	是否显示返回按钮
 */
@property(nonatomic,assign)BOOL navShowBack;

/**
 *	@brief	设置标题
 */
@property(nonatomic,copy)NSString *navTitle;

/*!
 *  @brief  显示返回导航条返回按钮
 */
- (void)showBackBarButton;


// hy:添加返回按钮
- (void)addBackbarButton;
- (void)addBackbarButtonWithImage:(UIImage*)image;

@end
