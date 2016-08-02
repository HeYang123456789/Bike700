//
//  Login.m
//  Bike700
//
//  Created by HEYANG on 16/8/1.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "Login.h"

@implementation Login


//+ (instancetype)sharedManager {
//    static Login *shared_manager = nil;
//    static dispatch_once_t pred;
//    dispatch_once(&pred, ^{
//        // hy:后面创建对象的方式需要根据后面实际情况修改
//        shared_manager = [[self alloc] init];
//    });
//    return shared_manager;
//}

// 头像的占位图
+ (UIImage*)placeHolderHeadImage{
    return [UIImage imageNamed:@"login_head"];
}

// 登录模型数据请求的网络路径
+ (NSString*)requestLoginPath{
    return @"https://appapi.700bike.com/bike/user/v1/login";
}

+ (NSDictionary*)requestLoginParames{
    NSDictionary *parames = @{
                              @"appVersion":@"2.1",
                              @"countryCode":@"86",
                              @"device":@"iPhone" ,
//                              @"password":@"d8578edf8458ce06fbc5bb76a58c",
                              @"password":@"d8578edf8458ce06fbc5bb76a58c5ca4",
                              @"phone":@"18720987504",
                              @"system":@"ios",
                              @"systemVersion":@"9.3.3"
                              };
    return parames;
}
+ (Login*)getLogin{
    Login *login = [Login new];
    login.process0 = 0;
    login.process1 = 1;
    login.process2 = 2;
    login.userId = 33643;
    
    login.phone = @"18720987504";
    login.nickName = @"骑单车的iOS工程师";
    login.photo = @"http://img1.700bike.com.cn/bike_app/2016/0720/30164336SFiC.jpg";
    login.bikeToken = @"gq3gfbcn599897fd3a9c4a75b0e3d809aefe84b4";
    
    return login;
}



@end
