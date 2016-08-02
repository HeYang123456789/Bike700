//
//  SelectionController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "SelectionController.h"
#import "SelectionCell.h"

// HY:先直接用AFN，后期重构这个网络单列类
#import "AFNetworking.h"

#import "Login.h"


@interface SelectionController ()<UITableViewDelegate,UITableViewDataSource>

/** selectionTableView */
@property (nonatomic,weak)UITableView *selectionTableView;
/** 模型数组 */
@property (nonatomic,strong)NSMutableArray *models;

@end

@implementation SelectionController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self setUpView];
    // 刷新数据
    [self refreshData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    _models = [SelectionModel datas];
    [self.selectionTableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpView{
    // 创建TableView
    UITableView *tableView = [UITableView new];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:tableView];
    self.selectionTableView = tableView;
    [self.selectionTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)refreshData{
    // 先用原生的NSURLSession SelectionCellsRequestURL
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:SelectionCellsRequestURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [@"date=2016-8-3&num=5" dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString* cookie = [[Login shareLogin] getCookieStr];
    DLog(@"cookie:%@",cookie);
    [request setValue:cookie forHTTPHeaderField:@"Cookie"];
    
    
    
    [[session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // 解析数据
        DLog(@"解析数据：%@--%@",response,[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        if (error) {
            DLog(@"\n error:%@",error);
            // 如果超时，也需要把这个逻辑实现出来
        }
        
        NSArray *cookies = [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies];
        [cookies enumerateObjectsUsingBlock:^(NSHTTPCookie *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            DLog(@"cookies : %@", obj.description);
        }];
        
    }] resume];
    
}

#pragma mark - UITableView的代理方法和数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (_models) {
        return _models.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SelectionCell *cell = [SelectionCell cellWithTableView:tableView];
    // 根据模型设置Cell
    SelectionModel *model = self.models[indexPath.row];
    [cell setCellModel:model];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [SelectionCell cellHeight];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - 私有方法
-(NSMutableArray *)models{
    if (!_models) {
        _models = [NSMutableArray new];
    }
    return _models;
}


@end
