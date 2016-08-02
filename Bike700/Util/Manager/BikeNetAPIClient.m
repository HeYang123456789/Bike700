//
//  BikeNetAPIClient.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "BikeNetAPIClient.h"

@implementation BikeNetAPIClient
+ (instancetype)sharedJsonClient {
    static BikeNetAPIClient *shared_manager = nil;
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{
        shared_manager = [[self alloc] init];
    });
    return shared_manager;
}
@end
