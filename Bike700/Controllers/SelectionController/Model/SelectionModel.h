//
//  SelectionModel.h
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

/*
 开发经验：如果模型嵌套，就要注意子模型需要在内部创建实例对象
 */

#import <Foundation/Foundation.h>

#define SelectionListNum @10

@class SelectionModelList;

@interface SelectionModel : NSObject

@property (nonatomic,strong)NSString *date;
@property (nonatomic,strong)SelectionModelList *list;

- (void)setListModelWith:(NSDictionary*)modelDict;

+ (NSString*)requestPath;
+ (NSDictionary*)getParams;

// 假数据
+ (NSMutableArray*)datas;
@end


@interface SelectionModelList : NSObject

@property (nonatomic,assign)NSInteger itemId;
@property (nonatomic,strong)NSString *itemType;
@property (nonatomic,strong)NSString *pic;
@property (nonatomic,strong)NSString *tagName;
@property (nonatomic,strong)NSString *tagType;
@property (nonatomic,strong)NSString *title;

@end


/**
 "date": "2016-07-29",
 "list": [{
 "title": "Mr. Bicycle｜他会长时间看着一个人，空想中捕捉美的感觉",
 "pic": "http://img1.700bike.com.cn/bike_app/2016/0729/82701477Bio3.jpeg",
 "itemType": "news",
 "itemId": 20182,
 "tagType": "person",
 "tagName": "人物"
 }]
 */