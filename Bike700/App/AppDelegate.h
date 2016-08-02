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


#pragma mark - 初始化控制器
- (void)initMainController;



+ (AppDelegate *)sharedObject;

@end

