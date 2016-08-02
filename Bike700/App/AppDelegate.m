//
//  AppDelegate.m
//  Bike700
//
//  Created by HEYANG on 16/7/21.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "AppDelegate.h"

#import "MainTabBarController.h"
#import "LoginController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


/**
 *  要有苹果推送通知的功能
 *  快速登录的功能
 *  点击“我的信息”能够访问健康数据
 */

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initWindow];
    
    // 初始化控制器
    [self initLoginController];
    
    
    // hy:首次启动如果是未登录进入，设置推送消息的角标为0
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    
    return YES;
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - 推送

#pragma mark - 初始化window
- (void)initWindow{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor clearColor];
    [self.window makeKeyAndVisible];
}

#pragma mark - 初始化控制器
- (void)initMainController{
    if (_window) {
        MainTabBarController *mainController = [MainTabBarController new];
        self.window.rootViewController = mainController;
    }
}
- (void)initLoginController{
    if (_window) {
        LoginController *loginController = [LoginController new];
        self.window.rootViewController = loginController;

    }
    
}

#pragma mark - static
+ (AppDelegate *)sharedObject{
   return (AppDelegate *)([UIApplication sharedApplication].delegate);
}




@end
