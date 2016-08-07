//
//  User.h
//  Bike700
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Login.h"

@class UserTotal,UserInfo;

@interface User : NSObject

@property (nonatomic,strong)UserTotal *userTotal;
@property (nonatomic,strong)UserInfo *userInfo;

+ (instancetype)shareUser;

+ (UIImage*)placeHolderHeadImage;
// 这个请求的请求字段是：userId	33643
+ (NSString*)requestUserInfoPath;
+ (NSDictionary*)requestLoginParames;

- (void)setUserTotalDic:(NSDictionary*)dic;
- (void)setUserInfoDic:(NSDictionary*)dic;
@end

@interface UserTotal: NSObject

@property (nonatomic,assign)NSInteger distance;
@property (nonatomic,assign)NSInteger followCount;
@property (nonatomic,assign)NSInteger followerCount;
@property (nonatomic,assign)NSInteger relation;
@property (nonatomic,assign)NSInteger unread;

@end

@interface UserInfo : NSObject

@property (nonatomic,assign)NSInteger userId;
@property (nonatomic,strong)NSString *email;
@property (nonatomic,strong)NSString *phone;
@property (nonatomic,strong)NSString *gender;
@property (nonatomic,strong)NSString *createTime;
@property (nonatomic,strong)NSString *birthday;
@property (nonatomic,strong)NSString *photo;
@property (nonatomic,strong)NSString *province;
@property (nonatomic,strong)NSString *city;
@property (nonatomic,strong)NSString *area;
@property (nonatomic,strong)NSString *nickname;
@property (nonatomic,strong)NSString *signature;
@property (nonatomic,assign)NSInteger height;
@property (nonatomic,assign)NSInteger weight;
@property (nonatomic,assign)NSInteger age;
@property (nonatomic,strong)NSString *countryCode;
@property (nonatomic,strong)NSString *country;
@property (nonatomic,assign)NSInteger weixin;
@property (nonatomic,assign)NSInteger qq;
@property (nonatomic,assign)NSInteger qqId;
@property (nonatomic,assign)NSInteger weibo;
@property (nonatomic,assign)NSInteger weiboId;
@property (nonatomic,strong)NSString *weixinId;
@property (nonatomic,strong)NSString *deviceNickname;
@property (nonatomic,assign)NSInteger renewGSMFee;
@property (nonatomic,assign)NSInteger isShowRenewFee;

@end
