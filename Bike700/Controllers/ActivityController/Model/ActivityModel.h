//
//  ActivityModel.h
//  Bike700
//
//  Created by HEYANG on 16/8/5.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActivityModel : NSObject

@property (nonatomic,assign)NSInteger activityId;// 活动ID
@property (nonatomic,strong)NSString *activityName;// 活动名称
@property (nonatomic,strong)NSString *coverPic;// 背景图片的链接
@property (nonatomic,strong)NSString *applyEndTime;// 支付结束时间
@property (nonatomic,assign)NSInteger praiseNum;//
@property (nonatomic,strong)NSString *typeName;
@property (nonatomic,assign)NSInteger praiseStatus;
@property (nonatomic,strong)NSString *subTitle;
@property (nonatomic,strong)NSString *startTime;
@property (nonatomic,strong)NSString *endTime;
@property (nonatomic,assign)NSInteger applyStatus;
@property (nonatomic,assign)NSInteger applyEndStatus;
// 1：报名进行中，2：活动进行中，3：活动已结束，4：报名已截止
@property (nonatomic,assign)NSInteger activityStatus;
@property (nonatomic,strong)NSString *createTime;
// 如果有奖励的显示奖励，没有奖励就显示后面的费用
@property (nonatomic,strong)NSString *prize;// 奖励
@property (nonatomic,strong)NSString *countdown;
// 有目标的显示目标，没有目标就显示地点，没地点显示不限
@property (nonatomic,assign)NSInteger target; // 目标
@property (nonatomic,strong)NSString *address;// 地点
@property (nonatomic,assign)NSInteger isPrice; // 是否要费用
@property (nonatomic,strong)NSString *price; // 费用
@property (nonatomic,strong)NSString *actType;
@property (nonatomic,strong)NSString *sportsType;

- (void)setListModelWith:(NSDictionary*)modelDict;
+ (NSString*)requestPath;
+ (NSDictionary*)getParams;

@end

/**
 "activityId": 10222,
 "activityName": "700众测 ｜ 第三十一期 ABUS U-Mini U型锁",
 "coverPic": "http://img1.700bike.com.cn/bike_app/2016/0805/97118143WkBf.jpg",
 "applyEndTime": "2016-08-12 12:00:00",
 "praiseNum": 0,
 "typeName": "普通活动",
 "praiseStatus": 0,
 "subTitle": "08月05日-08月12日",
 "startTime": "2016-08-05 19:00:00",
 "endTime": "2016-08-12 12:00:00",
 "applyStatus": 0,
 "applyEndStatus": 1,
 "activityStatus": 2,
 "createTime": "2016-08-05 19:38:47",
 "prize": "",
 "countdown": "",
 "target": 0,
 "address": "不限",
 "isPrice": 0,
 "price": "0.0",
 "actType": "normal",
 "sportsType": "distance"
 */