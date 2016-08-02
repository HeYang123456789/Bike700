//
//  MainNavigationController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "MainNavigationController.h"

#import "RootViewController.h"

@interface MainNavigationController () <UIGestureRecognizerDelegate>

@end

@implementation MainNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBarHidden =YES;
    
    // 默认一个导航控制器都是有滑动返回功能
    // 只要把系统的返回按钮覆盖,滑动返回功能实现
    // 滑动返回功能 -> 1.手势被干掉 pass 2.代理 -> 根控制器不需要滑动返回
    self.interactivePopGestureRecognizer.delegate = self;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 重写下面方法，统一设置返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    // 只有非根控制器,才需要设置返回按钮
    // 0
    if (self.childViewControllers.count > 0) { // 非根控制器
        
    }
    // 这个才是真正的跳转
    [super pushViewController:viewController animated:animated];
}
- (void)back
{
    [self popViewControllerAnimated:YES];
}



#pragma mark - UIGestureRecognizerDelegate
// 是否触发手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return self.childViewControllers.count > 1;
}



@end
