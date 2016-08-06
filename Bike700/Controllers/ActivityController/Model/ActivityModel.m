//
//  ActivityModel.m
//  Bike700
//
//  Created by HEYANG on 16/8/5.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "ActivityModel.h"


@implementation ActivityModel


- (void)setListModelWith:(NSDictionary*)modelDict{
//    DLog(@"modelDict:%@",modelDict);
    [self setValuesForKeysWithDictionary:modelDict];
}
+ (NSString*)requestPath{
    return ActivityCellsRequestURL;
}
+ (NSDictionary*)getParams{
    NSDictionary *dict = @{
                           @"size":ActivityListSize,
                           @"start":@0
                           };
    return dict;
}


@end
