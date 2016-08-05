//
//  MainTabBarController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "MainTabBarController.h"
#import "MainNavigationController.h"

#import "SelectionController.h"
#import "ActivityController.h"
#import "RankingController.h"
#import "MineController.h"
#import "BikeController.h"


@interface MainTabBarController ()

@end

@implementation MainTabBarController

// 加载类进内存的时候调用,只会调用一次
+ (void)load
{
    // hy:注意这里UITabBarItem是UITabBar上的每一个选项，而不是整个TabBar
    // 获取当前类下所有的tabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    // 1、设置选中标题的颜色
    // 创建富文本属性字典
    NSMutableDictionary *testAttr = [NSMutableDictionary dictionary];
    // 描述颜色
    testAttr[NSForegroundColorAttributeName] = [UIColor colorWithRed:1 green:0.78 blue:0.02 alpha:1];
    // 设置标题的富文本属性
    [item setTitleTextAttributes:testAttr forState:UIControlStateSelected];

    
    // 2、设置正常状态下字体
    // 问题:设置字体颜色不好使,注意:一定要先设置正常状态下字体大小
    NSMutableDictionary *testAttrNor = [NSMutableDictionary dictionary];
    // 描述字体
    testAttrNor[NSFontAttributeName] = [UIFont systemFontOfSize:9];
    // 设置标题的富文本属性
    [item setTitleTextAttributes:testAttrNor forState:UIControlStateNormal];
    
    // 3、设置文字的垂直偏移量
    [item setTitlePositionAdjustment:UIOffsetMake(0, -4)];
    
    
    // 4、设置UITabBar条的背景
    //[[UITabBar appearance] setBackgroundColor:[UIColor colorWithRed:0.14 green:0.15 blue:0.19 alpha:1]];
    // 如果只改backgroundColor的话, 会被UITabBarBackgroundView挡住而显示不出来的
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.14
                                                           green:0.15
                                                            blue:0.19
                                                           alpha:1]];
    // 取消透明效果
    [UITabBar appearance].translucent = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加子控制器
    [self addAllChildrenController];
    // 设置tabBarItem
    [self setTabBarItems];
    
    // 默认显示第三个控制器
    self.selectedIndex = 2;
}

- (void)addAllChildrenController{
    // 精选控制器
    SelectionController *selectionController = [SelectionController new];
    MainNavigationController *na1 = [[MainNavigationController alloc] initWithRootViewController:selectionController];
    [self addChildViewController:na1];
    
    // 活动控制器
    ActivityController *activityController = [ActivityController new];
    MainNavigationController *na2 = [[MainNavigationController alloc] initWithRootViewController:activityController];
    [self addChildViewController:na2];
    
    // 自行车控制器
    BikeController *bikeController = [BikeController new];
    MainNavigationController *na3 = [[MainNavigationController alloc] initWithRootViewController:bikeController];
    [self addChildViewController:na3];
    
    // 排行控制器
    RankingController *rankingController = [RankingController new];
    MainNavigationController *na4 = [[MainNavigationController alloc] initWithRootViewController:rankingController];
    [self addChildViewController:na4];
    
    // 我的控制器
    MineController *mineController = [MineController new];
    MainNavigationController *na5 = [[MainNavigationController alloc] initWithRootViewController:mineController];
    [self addChildViewController:na5];
}
- (void)setTabBarItems{
    
    UINavigationController* na0 = (UINavigationController*)self.childViewControllers[0];
    na0.tabBarItem.title = @"精选";
    na0.tabBarItem.image = [UIImage imageRenderingModeImageNamed:@"tab_bar_home_g"] ;
    na0.tabBarItem.selectedImage = [UIImage imageRenderingModeImageNamed:@"tab_bar_home_y"];
    
    UINavigationController* na1 = (UINavigationController*)self.childViewControllers[1];
    na1.tabBarItem.title = @"活动";
    na1.tabBarItem.image = [UIImage imageRenderingModeImageNamed:@"tab_bar_quaner_g"] ;
    na1.tabBarItem.selectedImage = [UIImage imageRenderingModeImageNamed:@"tab_bar_quaner_y"];
    
    UINavigationController* na2 = (UINavigationController*)self.childViewControllers[2];
    na2.tabBarItem.image = [UIImage imageRenderingModeImageNamed:@"tab_bar_ride0"] ;
    na2.tabBarItem.selectedImage = [UIImage imageRenderingModeImageNamed:@"tab_bar_ride1"];
    [na2.tabBarItem setImageInsets:UIEdgeInsetsMake(6, 0, -6, 0)];
    
    UINavigationController* na3 = (UINavigationController*)self.childViewControllers[3];
    na3.tabBarItem.title = @"排行";
    na3.tabBarItem.image = [UIImage imageRenderingModeImageNamed:@"tab_bar_ranking_g"] ;
    na3.tabBarItem.selectedImage = [UIImage imageRenderingModeImageNamed:@"tab_bar_ranking_y"];
    
    UINavigationController* na4 = (UINavigationController*)self.childViewControllers[4];
    na4.tabBarItem.title = @"我的";
    na4.tabBarItem.image = [UIImage imageRenderingModeImageNamed:@"tab_bar_me_g"] ;
    na4.tabBarItem.selectedImage = [UIImage imageRenderingModeImageNamed:@"tab_bar_me_y"];

}


#pragma mark - 私有方法

@end
