//
//  Login.h
//  Bike700
//
//  Created by HEYANG on 16/8/1.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Login : NSObject

+ (instancetype)shareLogin;

@property (nonatomic,assign)NSInteger process0;
@property (nonatomic,assign)NSInteger process1;
@property (nonatomic,assign)NSInteger process2;
@property (nonatomic,assign)NSInteger userId;

@property (nonatomic,strong)NSString *phone;
@property (nonatomic,strong)NSString *nickName;
@property (nonatomic,strong)NSString *photo;
@property (nonatomic,strong)NSString *bikeToken;

+ (UIImage*)placeHolderHeadImage;
+ (NSString*)requestLoginPath;
+ (NSDictionary*)requestLoginParames;

- (NSString*)getCookieStr;
+ (BOOL) isLogin;
+ (void)doLogin:(NSDictionary *)loginData complement:(void(^)())complment;
+ (NSString*)getCookieStr;

// 假数据
+ (Login*)getLoginData;

@end
