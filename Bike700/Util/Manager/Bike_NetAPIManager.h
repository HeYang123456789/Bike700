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

// 登录请求
- (void)request_Login_WithPath:(NSString *)path Params:(id)params andBlock:(void (^)(id data, NSError *error))block;

@end
