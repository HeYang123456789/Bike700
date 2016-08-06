//
//  ActivityController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "ActivityController.h"
#import "Bike_NetAPIManager.h"
#import "ActivityCell.h"

@interface ActivityController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>


/** selectionTableView */
@property (nonatomic,weak)UITableView *activityTableView;
/** 模型数组 */
@property (nonatomic,strong)NSMutableArray *models;

/** 在ScorllView代理方法是否请求了数据 */
@property (nonatomic,assign)BOOL isRequestByScrollView;

@end

@implementation ActivityController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化UI
    [self setUpView];
    // 刷新数据
    [self refreshData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)setUpView{
    // 创建TableView
    UITableView *tableView = [UITableView new];
//    tableView.frame = self.view.frame;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.rowHeight = [ActivityCell cellHeight];// 对于固定高度的cell，这是很好的优化
    [self.view addSubview:tableView];
    self.activityTableView = tableView;
    
    [self.activityTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _isRequestByScrollView = NO;
}

- (void)refreshData{
    // 直接用网络请求的单例
    @weakify(self);
    [[Bike_NetAPIManager sharedManager] request_Activity_Path:[ActivityModel requestPath] params:[ActivityModel getParams] andBlock:^(id data, NSError *error) {
        @strongify(self);
        if (data) {
            NSDictionary *dataDict = (NSDictionary*)data[@"data"];// 根
            
            // 模型数组(元素都是字典)
            NSArray *listDict = dataDict[@"list"];
            if (listDict.count > 0) {
                for (NSDictionary *modelDict in listDict) {
                    ActivityModel *model = [ActivityModel new];
                    [model setListModelWith:modelDict];
                    [self.models addObject:model];
                }
                [self.activityTableView reloadData];
            }
        }
    }];
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
    ActivityCell *cell = [ActivityCell cellWithTableView:tableView];
    // 根据模型设置Cell
    ActivityModel *model = self.models[indexPath.row];
    [cell setCellModel:model];
    DLog(@"===创建第%ld行的cell,状态：%ld===",indexPath.row,model.activityStatus);
    
    _isRequestByScrollView = NO;
    return cell;
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
