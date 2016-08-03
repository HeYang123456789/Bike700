//
//  MineController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "MineController.h"
#import "EditMineInfoController.h"

#import "ImageNameSexLocalCell.h"
#import "ImageTitleCell.h"

@interface MineController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak)UITableView *mineTableView;

@end

@implementation MineController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置导航条的item
    HYNavItem* navItem = [[HYNavItem alloc] init];
    navItem.title = @"我的";
    navItem.titleColor = [UIColor blackColor];
    self.navBar.backgroundColor = [UIColor whiteColor];
    self.navBar.topItem = navItem;
    
    
    self.automaticallyAdjustsScrollViewInsets = false;
    // 添加UITableView
    UITableView *tableView = [UITableView new];
    tableView.frame = CGRectMake(0, 64, UIScreenWidth, UIScreenHeight-64);
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = [UIColor clearColor];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.mineTableView = tableView;
//    [self.mineTableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.navBar.mas_bottom);
//        make.left.equalTo(self.view);
//        make.right.equalTo(self.view);
//        make.bottom.equalTo(self.view);
//    }];
    tableView.tableHeaderView.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }if (section == 1) {
        return 5;
    }if (section == 2) {
        return 3;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            ImageNameSexLocalCell *cell = [ImageNameSexLocalCell cellWithTableView:tableView];
//            [cell setCellModel:[Login getLogin]];
            return cell;
        }
    }
    else if (indexPath.section == 1) {
        ImageTitleCell *cell = [ImageTitleCell cellWithTableView:tableView];
        switch (indexPath.row) {
            case 0:
                [cell setImage:[UIImage imageNamed:@"me_1qixing"] title:@"骑行历史"];
                break;
            case 1:
                [cell setImage:[UIImage imageNamed:@"me_2huodong"] title:@"活动"];
                break;
            case 2:
                [cell setImage:[UIImage imageNamed:@"me_4shoucang"] title:@"收藏"];
                break;
            case 3:
                [cell setImage:[UIImage imageNamed:@"me_5bike"] title:@"700Bike自行车"];
                break;
            case 4:
                [cell setImage:[UIImage imageNamed:@"me_5.1"] title:@"700Bike官方商城"];
                break;
            default:
                break;
        }
        return cell;
    }
    else if (indexPath.section == 2) {
        ImageTitleCell *cell = [ImageTitleCell cellWithTableView:tableView];
        switch (indexPath.row) {
            case 0:
                [cell setImage:[UIImage imageNamed:@"me_6xiaoxi"] title:@"消息"];
                break;
            case 1:
                [cell setImage:[UIImage imageNamed:@"me_9_chatonline"] title:@"在线客服"];
                break;
            case 2:
                [cell setImage:[UIImage imageNamed:@"me_7shezhi"] title:@"设置"];
                break;
            default:
                break;
        }
        return cell;
    }
    
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return [ImageNameSexLocalCell cellHeight];
        }
    }
    return [ImageTitleCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView  deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        if (indexPath.row == 0){
            EditMineInfoController *emic = [EditMineInfoController new];
            emic.hidesBottomBarWhenPushed = YES;// 一定要再显示前设置隐藏底部的Tabbar条
            [self.navigationController pushViewController:emic animated:YES];
        }
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    // 为了将系统本身的headrView的颜色去掉，这里就直接用透明的View替换
    UIView *headrView = [UIView new];
    headrView.backgroundColor = [UIColor clearColor];
    return headrView;
}





@end
