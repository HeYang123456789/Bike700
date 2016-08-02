//
//  Login.m
//  Bike700
//
//  Created by HEYANG on 16/8/1.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#define kLoginStatus @"login_status"
#define kCookie @"Cookie"

#import "Login.h"

@implementation Login

+ (instancetype)shareLogin{
    static Login *login = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        // hy:后面创建对象的方式需要根据后面实际情况修改
        login = [[self alloc] init];
    });
    return login;
}


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
                              @"device":@"iPhone",
//                              @"password":@"d8578edf8458ce06fbc5bb76a58c",
                              @"password":@"d8578edf8458ce06fbc5bb76a58c5ca4",
                              @"phone":@"18720987504",
                              @"system":@"ios",
                              @"systemVersion":@"9.3.3"
                              };
    return parames;
}

+ (BOOL)isLogin{
    NSNumber *loginStatus = [[NSUserDefaults standardUserDefaults] objectForKey:kLoginStatus];
    // hy:登录的状态值+是否有用户个人信息（没取出来，就没有用户基本数据，就不要登录了）
    
    if (loginStatus.boolValue){
//    if (loginStatus.boolValue && [Login curLoginUser]) {
//        User *loginUser = [Login curLoginUser];
    
//        if (loginUser.status && loginUser.status.integerValue == 0) {
//            return NO;
//        }
        return YES;
    }else{
        return NO;
    }
}

- (NSString*)getCookieStr{
    NSParameterAssert(self.bikeToken);
    // 获取cookie
    NSString *cookieBikeToken = self.bikeToken;
    DLog(@"cookieBikeToken:%@",cookieBikeToken);
    NSString *cookieString = [NSString stringWithFormat:@"PassToken=%@;BikeToken=%@",cookieBikeToken,cookieBikeToken];
    return cookieString;
}

+ (void)doLogin:(NSDictionary *)loginData{
    
    // 获取cookie
    NSString *cookieBikeToken = loginData[@"bikeToken"];
    DLog(@"cookieBikeToken:%@",cookieBikeToken);
    NSString *cookieString = [NSString stringWithFormat:@"PassToken=%@;BikeToken=%@",cookieBikeToken,cookieBikeToken];
    NSData *cookieData = [cookieString dataUsingEncoding:NSUTF8StringEncoding];
    
//    NSHTTPCookie *cookieHttp = [NSHTTPCookie alloc] initw
    
    
//    NSHTTPCookieStorage * cookieStorage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
//    [cookieStorage setCookie: cookieData];
    
    
//    [Login saveCookie];
    
//    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
//    [cookies enumerateObjectsUsingBlock:^(NSHTTPCookie *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        NSLog(@"cookies : %@", obj.description);
//    }];
    
    if (loginData) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:[NSNumber numberWithBool:YES] forKey:kLoginStatus];
    }else{
        
    }
}

// hy:退出登录
+ (void)doLogout{
    // hy:设置applicationIconBadgeNumber
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    // 清空用户默认偏好设置，又好像是本地化
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSNumber numberWithBool:NO] forKey:kLoginStatus];
    [defaults synchronize];// hy:需要查这是干嘛的 ？
    //删掉 coding 的 cookie   hy:cookie是干嘛的 ？
    //可以参考：http://www.jianshu.com/p/e17e855f2d20
    NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
    [cookies enumerateObjectsUsingBlock:^(NSHTTPCookie *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.domain hasSuffix:@".700bike.com"]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:obj];
        }
    }];
}


#pragma mark - Cookie
+ (void)saveCookie{
    NSData * cookiesData = [NSKeyedArchiver archivedDataWithRootObject: [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    DLog(@"cookiesData:%@",[[NSString alloc] initWithData:cookiesData encoding:NSUTF8StringEncoding] );
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject: cookiesData forKey:kCookie];
    [defaults synchronize];
}


#pragma mark - 字典转模型的方法
- (void)setLoginDiction:(NSDictionary*)dic{
    
}

#pragma mark - 假数据
+ (Login*)getLoginData{
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
