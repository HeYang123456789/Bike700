//
//  RootViewController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置背景
    self.view.backgroundColor = RootVC_BackgroundColor;
    // 下面这个类别方法没用哦
//    self.view.backgroundColor = [UIColor colorWithString:@"#e3e4e8"];
    
    // 下面这些属性外部设置，或者内部这里默认设置
    self.navHeight = 64;
    
    
    // hy:缺点：并不是被添加在最上层
    [self addNavBar];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(HYNavBar *)navBar
{
    if (_navBar == nil)
    {
        _navBar = [[HYNavBar alloc] initWithFrame:CGRectMake(0, 0, self.view.width, 64)];
    }
    return _navBar;
}

-(void)setNavLogoImg:(UIImage *)navLogoImg
{
    _navLogoImg = navLogoImg;
}

-(void)setNavBarBg:(UIImage *)bgImg
{
    [self.navBar setBgImg:bgImg];
}

-(void)setNavTitle:(NSString *)navTitle
{
    _navTitle =navTitle;
    
    if (self.navBar) {
        self.navBar.topItem.title =navTitle;
        [self.navBar setNeedsLayout];
    }
}

#pragma mark initNavBar
-(void)addNavBar
{
    [self.view addSubview:self.navBar];
    
    [self.navBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *dict = NSDictionaryOfVariableBindings(_navBar);
    NSString *vf0 = @"|-0-[_navBar]-0-|";
    NSString *vf1 = [NSString stringWithFormat:@"V:|-0-[_navBar(%f)]",self.navHeight];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf0 options:0 metrics:nil views:dict]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vf1 options:0 metrics:nil views:dict]];
}

- (void)backToPrev
{
    [self.navigationController popViewControllerAnimated:YES];
}

// hy:有时间需要看懂这个返回按钮的逻辑，包括返回按钮的item设置，然后修改它
- (void)showBackBarButton{
    if (self.navShowBack && self.navigationController){
        NSArray *array = self.navigationController.viewControllers;
        if ([array count] > 0) {
            id rootVC = [self.navigationController.viewControllers objectAtIndex:0];
            id topVC = self.navigationController.topViewController;
            if (self != rootVC && self == topVC && !self.navBar.leftBarButtonItem) {
                self.navBar.leftBarButtonItem =[[HYBarButtonItem alloc] initBackWithTarget:self action:@selector(backToPrev)];
                if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]){
                    //开启iOS7的滑动返回效果
                    self.navigationController.interactivePopGestureRecognizer.delegate = nil;
                }
            }
        }
    }
}

#pragma mark - 私有方法
- (void)addBackbarButton{
    // 设置左边返回按钮
    if (self.navBar) {
        UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, 44, 44);
        [backButton setBackgroundImage:[UIImage imageNamed:@"back_black"] forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        HYBarButtonItem *backBarBtnItem = [[HYBarButtonItem alloc] initWithCustomView:backButton];
        self.navBar.leftBarButtonItem = backBarBtnItem;
    }
}
- (void)addBackbarButtonWithImage:(UIImage*)image{
    // 设置左边返回按钮
    if (self.navBar) {
        UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        backButton.frame = CGRectMake(0, 0, 44, 44);
        [backButton setBackgroundImage:image forState:UIControlStateNormal];
        [backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        HYBarButtonItem *backBarBtnItem = [[HYBarButtonItem alloc] initWithCustomView:backButton];
        self.navBar.leftBarButtonItem = backBarBtnItem;
    }
}
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
