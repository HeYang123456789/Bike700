//
//  LoginController.m
//  Bike700
//
//  Created by HEYANG on 16/7/30.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "LoginController.h"
#import "UITextField+Common.h"
#import "AppDelegate.h"
#import "PromptView.h"
// 登录控制器肯定需要登录模型
#import "Login.h"

#import "Bike_NetAPIManager.h"

@interface LoginController ()

//@property (nonatomic,strong)Login *login;

@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.phoneTextField setPlaceholderTextWhite];
    [self.passwordTextField setPlaceholderTextWhite];
    
    
    
}

#pragma mark - UI控件事件监听
- (IBAction)loginButton:(UIButton *)sender {
    DLog(@"开始登录");
    [self sendLogin];
    
    
}

- (IBAction)forgetPasswordButton:(UIButton *)sender {
    DLog(@"忘记密码被点击了");
}


- (IBAction)weichatButton:(UIButton *)sender {
    DLog(@"微信第三方登录");
}
- (IBAction)qqButton:(UIButton *)sender {
    DLog(@"QQ第三方登录");
}
- (IBAction)weiboButton:(UIButton *)sender {
    DLog(@"微博第三方登录");
}


- (void)sendLogin{
    [[Bike_NetAPIManager sharedManager] request_Login_WithPath:[Login requestLoginPath] Params:[Login requestLoginParames] andBlock:^(id data, NSError *error) {
        if (data) {
            NSDictionary* dataDic = ((NSDictionary*)data)[@"data"];
            if (dataDic && dataDic.count > 0) {
                // 字典转模型
                Login *login = [[Login alloc] init];
                [login setValuesForKeysWithDictionary:dataDic[@"data"]];
                [[AppDelegate sharedObject] initMainController];
            }else{
                NSString *desc = ((NSDictionary*)data)[@"desc"];
                DLog(@"desc:%@",desc);
                [PromptView showError:desc];
            }
        }
    }];
}

//#pragma mark - 使用原生的NSURLSession请求数据
//#define requestHTTPBody @"appVersion=2.1&countryCode=86&device=iPhone&password=d8578edf8458ce06fbc5bb76a58c5ca4&phone=18720987504&system=ios&systemVersion=9.3.3"
//- (void)login1{
//    NSURLSession *session = [NSURLSession sharedSession];
//    NSURL *url = [NSURL URLWithString:@"https://appapi.700bike.com/bike/user/v1/login"];
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
//    request.HTTPMethod = @"POST";
//    request.HTTPBody = [requestHTTPBody dataUsingEncoding:NSUTF8StringEncoding];
//
//    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//        // 解析数据
//        DLog(@"解析数据：%@--%@",response,[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
//        if (error) {
//            DLog(@"\n error:%@",error);
//            // 如果超时，也需要把这个逻辑实现出来
//
//
//        }
//
//
//    }] resume];
//}
@end
