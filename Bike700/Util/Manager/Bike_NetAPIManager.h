//
//  Bike_NetAPIManager.h
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bike_NetAPIManager : NSObject

+ (instancetype)sharedManager;

#pragma mark - 登录注册模块
- (void)request_Login_Path:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))block;

#pragma mark - 精选模块
- (void)request_Selection_Path:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))bloc;

#pragma mark - 活动模块
- (void)request_Activity_Path:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))bloc;

#pragma mark - 用户信息模块
- (void)request_UserInfo_Path:(NSString *)path params:(id)params andBlock:(void (^)(id data, NSError *error))bloc;

@end
