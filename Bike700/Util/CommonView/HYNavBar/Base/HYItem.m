//
//  HYItem.m
//  NavigationBar
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYItem.h"

@implementation HYItem
@synthesize tag;


- (id)init{
    if (self = [super init]) {
        self.tag = 0;
    }
    return self;
}

@end
