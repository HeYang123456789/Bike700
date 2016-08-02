//
//  User.m
//  Bike700
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.userTotal = [UserTotal new];
        self.userInfo = [UserInfo new];
    }
    return self;
}

+ (NSString*)userInfoURLRequestPath{
    return @"https://appapi.700bike.com/bike/user/v2/profile";
}

@end

@implementation UserTotal


@end

@implementation UserInfo


@end