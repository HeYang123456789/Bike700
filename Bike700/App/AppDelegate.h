//
//  AppDelegate.h
//  Bike700
//
//  Created by HEYANG on 16/7/21.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// 精选、活动控制器，首次请求的模型数据
@property (nonatomic,strong)NSMutableArray *selectionModels;
@property (nonatomic,strong)NSMutableArray *activityModels;

#pragma mark - 初始化控制器
- (void)initMainController;

+ (AppDelegate *)sharedObject;

- (void)requestSelectionVCModelListComplement:(void(^)())complment;
- (void)requestActivityVCModelListComplement:(void(^)())complment;

@end

