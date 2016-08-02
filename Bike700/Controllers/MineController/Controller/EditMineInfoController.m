//
//  EditMineInfoController.m
//  Bike700
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "EditMineInfoController.h"

@interface EditMineInfoController ()

@end

@implementation EditMineInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条的item
    HYNavItem* navItem = [[HYNavItem alloc] init];
    navItem.title = @"编辑资料";
    navItem.titleColor = [UIColor blackColor];
    self.navBar.backgroundColor = [UIColor whiteColor];
    self.navBar.topItem = navItem;
    
    // 设置右边按钮
    HYBarButtonItem *rightBarBtnItem = [[HYBarButtonItem alloc]
            initWithTitle:@"保存" target:self action:@selector(barRightButtonClicked:)];
    rightBarBtnItem.titleColor = [UIColor blackColor];
    rightBarBtnItem.titleFont = [UIFont systemFontOfSize:15];
    self.navBar.rightBarButtonItem = rightBarBtnItem;
    
    // 设置左边返回按钮
    [self addBackbarButton];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)barRightButtonClicked:(UIButton*)sender{
    
}

@end
