//
//  Bike_NetAPIManager.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "Bike_NetAPIManager.h"

@implementation Bike_NetAPIManager

+ (instancetype)sharedManager {
    static Bike_NetAPIManager *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        // hy:后面创建对象的方式需要根据后面实际情况修改
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}

#pragma mark - 登录的数据请求
- (void)request_Login_Path:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))bloc{
    // 创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"\n=======response=======\n%@:\n%@", path, responseObject);
        bloc(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"\n=======error=======\n%@:\n%@", path, error);
        bloc(nil,error);
    }];
}

#pragma mark - 精选控制器的数据请求
- (void)request_Selection_Path:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))bloc{
    // 创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 管理者设置请求序列对象设置添加请求头信息
    NSString *cookieStr = [[NSUserDefaults standardUserDefaults] objectForKey:kCookie];
    if (cookieStr) {
        [manager.requestSerializer setValue:cookieStr forHTTPHeaderField:@"Cookie"];
    }
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"\n=======response=======\n%@:\n%@", path, responseObject);
        bloc(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"\n=======error=======\n%@:\n%@", path, error);
        bloc(nil,error);
    }];
}

#pragma mark - 活动控制器的数据请求
- (void)request_Activity_Path:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))bloc{
    // 创建会话管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    // 管理者设置请求序列对象设置添加请求头信息
    NSString *cookieStr = [[NSUserDefaults standardUserDefaults] objectForKey:kCookie];
    if (cookieStr) {
        [manager.requestSerializer setValue:cookieStr forHTTPHeaderField:@"Cookie"];
    }
    [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        DLog(@"\n=======response=======\n%@:\n%@", path, responseObject);
        bloc(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        DLog(@"\n=======error=======\n%@:\n%@", path, error);
        bloc(nil,error);
    }];
}



@end
