//
//  SelectionController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "SelectionController.h"
#import "SelectionCell.h"
#import "Bike_NetAPIManager.h"

// HY:先直接用AFN，后期重构这个网络单列类
#import "AFNetworking.h"

#import "Login.h"


@interface SelectionController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

/** selectionTableView */
@property (nonatomic,weak)UITableView *selectionTableView;
/** 模型数组 */
@property (nonatomic,strong)NSMutableArray *models;

/** 在ScorllView代理方法是否请求了数据 */
@property (nonatomic,assign)BOOL isRequestByScrollView;

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
    
    // 假数据
//    _models = [SelectionModel datas];
//    [self.selectionTableView reloadData];
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
    
    __weak SelectionController *weakSelf = self;
    [self.selectionTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    
    _isRequestByScrollView = NO;
}

- (void)refreshData{
    
    // 直接用网络请求的单例
    __weak SelectionController *weakSelf = self;
    [[Bike_NetAPIManager sharedManager] request_Selection_Path:[SelectionModel requestPath] params:[SelectionModel getParams] andBlock:^(id data, NSError *error) {
        // 处理字典转模型的业务
        if (data) {
            NSDictionary *dict = ((NSDictionary*)data)[@"data"];
            BOOL hasNext = dict[@"hasNext"];
//            if (hasNext == 1) {
//                DLog(@"还有数据");
//            }else{
//                DLog(@"没有数据");
//            }
            NSArray *dictDataArr = dict[@"list"];
            if (dictDataArr && dictDataArr.count>0) {
                for (NSDictionary *modelDict in dictDataArr) {
                    SelectionModel* model = [SelectionModel new];
                    model.date = modelDict[@"date"];
                    [model setListModelWith:modelDict[@"list"][0]];
                    [weakSelf.models addObject:model];
                }
                [weakSelf.selectionTableView reloadData];
            }
        }else{
            
        }
    }];
    
    
    // 原生的NSURLSession SelectionCellsRequestURL
//    [self nsurlSessionRequest];
    
}


#pragma mark - scrollView的代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat h = scrollView.height;
    CGFloat contentYOffset = scrollView.contentOffset.y;
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYOffset;
    if (distanceFromBottom <= (h+UIScreenHeight)) {
        if (_isRequestByScrollView == NO) {
            _isRequestByScrollView = YES;
            DLog(@"开始请求数据，并且刷新tableview");
            
            SelectionModel* model = [self.models lastObject];
            NSString *modelDate = model.date;
            
            NSMutableDictionary *paramsDic = [NSMutableDictionary new];
            [paramsDic setValue:modelDate forKey:@"date"];
            [paramsDic setValue:@5 forKey:@"num"];
            
            
            
            // 直接用网络请求的单例
            __weak SelectionController *weakSelf = self;
            [[Bike_NetAPIManager sharedManager] request_Selection_Path:[SelectionModel requestPath] params:paramsDic andBlock:^(id data, NSError *error) {
                // 处理字典转模型的业务
                if (data) {
                    NSDictionary *dict = ((NSDictionary*)data)[@"data"];
                    BOOL hasNext = dict[@"hasNext"];
//                    if (hasNext == 1) {
//                        DLog(@"还有数据");
//                    }else{
//                        DLog(@"没有数据");
//                    }
                    NSArray *dictDataArr = dict[@"list"];
                    DLog(@"数组个数：%ld",dictDataArr.count);
                    if (dictDataArr && dictDataArr.count>0) {
                        for (NSDictionary *modelDict in dictDataArr) {
                            SelectionModel* model = [SelectionModel new];
                            model.date = modelDict[@"date"];
                            [model setListModelWith:modelDict[@"list"][0]];
                            [weakSelf.models addObject:model];
                        }
                        [weakSelf.selectionTableView reloadData];
                    }
                }else{
                    
                }
            }];
        }else{
//
        }
    }
}


#pragma mark - UITableView的代理方法和数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    DLog(@"=要创建%ld个cell的个数=",_models.count);
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
//    DLog(@"===创建第%ld行的cell===",indexPath.row);
    
    _isRequestByScrollView = NO;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    DLog(@"==返回第%ld行Cell高度==",indexPath.row);
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

- (void)nsurlSessionRequest{
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


@end
