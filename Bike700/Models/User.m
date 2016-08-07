//
//  User.m
//  Bike700
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "User.h"

@implementation User

+ (instancetype)shareUser{
    static User *user = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        // hy:后面创建对象的方式需要根据后面实际情况修改
        user = [[self alloc] init];
    });
    return user;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

// 头像的占位图
+ (UIImage*)placeHolderHeadImage{
    return [UIImage imageNamed:@"login_head"];
}

+ (NSString*)requestUserInfoPath{
    return @"https://appapi.700bike.com/bike/user/v2/profile";
}

+ (NSDictionary*)requestLoginParames{
    
    NSNumber *userID = [Login getUserID];
    
    NSDictionary *parames = @{@"userID":userID};
    return parames;
}

#pragma mark - 字典转模型的方法
- (void)setUserTotalDic:(NSDictionary*)dic{
    DLog(@"转模型之前：%@",dic);
    [self.userTotal setValuesForKeysWithDictionary:dic];
    DLog(@"转模型之后%@",_userTotal);
}
- (void)setUserInfoDic:(NSDictionary*)dic{
    DLog(@"转模型之前：%@",dic);
    [self.userInfo setValuesForKeysWithDictionary:dic];
    DLog(@"转模型之后%@",_userInfo);
}


#pragma mark - 懒加载
-(UserInfo *)userInfo{
    if (!_userInfo) {
        _userInfo = [UserInfo new];
    }
    return _userInfo;
}
-(UserTotal *)userTotal{
    if (!_userTotal) {
        _userTotal = [UserTotal new];
    }
    return _userTotal;
}
@end

@implementation UserTotal


@end

@implementation UserInfo


@end