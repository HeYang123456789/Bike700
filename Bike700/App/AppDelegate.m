//
//  AppDelegate.m
//  Bike700
//
//  Created by HEYANG on 16/7/21.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "AppDelegate.h"

#import "SelectionModel.h"
#import "ActivityModel.h"

#import "Bike_NetAPIManager.h"

#import "MainTabBarController.h"
#import "LoginController.h"


@interface AppDelegate ()

@property (nonatomic,assign)NSInteger runInitMainVCNum;

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
    
    
    _runInitMainVCNum = 0;
    
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
    _runInitMainVCNum += 1;
    DLog(@"调用了%ld次初始化主控制器的方法",_runInitMainVCNum);
    if (_window && _runInitMainVCNum == 2) {
        MainTabBarController *mainController = [MainTabBarController new];
        self.window.rootViewController = mainController;
        DLog(@"初始化了主控制器");
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

#pragma mark - Others
// 获取精选控制器的数据请求
- (void)requestSelectionVCModelListComplement:(void(^)())complment{
    NSMutableArray *models = [NSMutableArray new];
    // 直接用网络请求的单例
    @weakify(self);
    [[Bike_NetAPIManager sharedManager] request_Selection_Path:[SelectionModel requestPath] params:[SelectionModel getParams] andBlock:^(id data, NSError *error) {
        @strongify(self);
        // 处理字典转模型的业务
        if (data) {
            NSDictionary *dict = ((NSDictionary*)data)[@"data"];
            BOOL hasNext = dict[@"hasNext"];
            DLog(@"%@数据",(hasNext == 1?@"还有":@"没有"));
            NSArray *dictDataArr = dict[@"list"];
            if (dictDataArr && dictDataArr.count>0) {
                for (NSDictionary *modelDict in dictDataArr) {
                    SelectionModel* model = [SelectionModel new];
                    model.date = modelDict[@"date"];
                    [model setListModelWith:modelDict[@"list"][0]];
                    [models addObject:model];
                }
            }
            self.selectionModels = models;
        }else{
            
        }
        complment();
    }];
}

// 获取活动控制器的数据请求
- (void)requestActivityVCModelListComplement:(void(^)())complment{
    NSMutableArray *models = [NSMutableArray new];
    // 直接用网络请求的单例
    @weakify(self);
    [[Bike_NetAPIManager sharedManager] request_Activity_Path:[ActivityModel requestPath] params:[ActivityModel getParams] andBlock:^(id data, NSError *error) {
        @strongify(self);
        if (data) {
            NSDictionary *dataDict = (NSDictionary*)data[@"data"];// 根
            
            // 模型数组(元素都是字典)
            NSArray *listDict = dataDict[@"list"];
            if (listDict.count > 0) {
                for (NSDictionary *modelDict in listDict) {
                    ActivityModel *model = [ActivityModel new];
                    [model setListModelWith:modelDict];
                    [models addObject:model];
                }
            }
            self.activityModels = models;
        }
        complment();
    }];

}



@end
