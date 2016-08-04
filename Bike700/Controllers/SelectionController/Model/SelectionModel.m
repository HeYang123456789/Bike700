//
//  SelectionModel.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "SelectionModel.h"

@implementation SelectionModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    
    }
    return self;
}

- (void)setListModelWith:(NSDictionary*)modelDict{
//    DLog(@"modelDict:%@",modelDict);
    // 下面会报错：unrecognized selector sent to instance 0x161016eb0
    [self.list setValuesForKeysWithDictionary:modelDict];
//    self.list.itemId = (NSInteger)(modelDict[@"itemId"]);
//    self.list.itemType = modelDict[@"itemType"];
//    self.list.pic = modelDict[@"pic"];
//    self.list.tagName = modelDict[@"tagName"];
//    self.list.tagType = modelDict[@"tagType"];
//    self.list.title = modelDict[@"title"];
//    DLog(@"list:%ld-%@-%@-%@-%@-%@",self.list.itemId,self.list.itemType,self.list.pic,self.list.tagName,self.list.tagType,self.list.title);
}

- (SelectionModelList *)list{
    if (!_list) {
        _list = [SelectionModelList new];
    }
    return _list;
}

+ (NSString*)requestPath{
    return SelectionCellsRequestURL;
}
+ (NSDictionary*)getParams{
    NSDictionary *dict = @{
                           @"date":@"2016-8-5",
                           @"num":@"5"
                           };
    return dict;
}

+ (NSMutableArray*)datas{
    NSMutableArray *models = [NSMutableArray new];
    
    SelectionModel *model1 = [SelectionModel new];
    model1.date = @"2016-07-29";
    model1.list.title = @"Mr. Bicycle｜他会长时间看着一个人，空想中捕捉美的感觉";
    model1.list.pic = @"http://img1.700bike.com.cn/bike_app/2016/0729/82701477Bio3.jpeg";
    model1.list.tagName = @"人物";
    
    SelectionModel *model2 = [SelectionModel new];
    model2.date = @"2016-07-27";
    model2.list.title = @"骑闯天路 | 风情海岛地狱磨炼-宁波站";
    model2.list.pic = @"http://img1.700bike.com.cn/bike_app/2016/0728/69983494bQsp.jpg";
    model2.list.tagName = @"人物";
    
    SelectionModel *model3 = [SelectionModel new];
    model3.date = @"2016-07-26";
    model3.list.title = @"Ms. Bicycle｜她用一件旗袍告诉你，古典也时髦";
    model3.list.pic = @"http://img1.700bike.com.cn/bike_app/2016/0727/92058446iu3H.jpg";
    model3.list.tagName = @"人物";
    
    [models addObjectsFromArray:@[model1,model2,model3]];
    
    return models;
}

@end


@implementation SelectionModelList

@end