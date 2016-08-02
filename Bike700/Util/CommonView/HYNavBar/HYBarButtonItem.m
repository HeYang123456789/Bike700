//
//  MainTabBarController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYBarButtonItem.h"

@implementation HYBarButtonItem
@synthesize action = _action;
@synthesize target = _target;
@synthesize style = _style;
@synthesize customView = _customView;


- (id)init{
    if (self = [super init]) {
        self.style = HYBarButtonItemStyleBordered;
        self.customView = nil;
    }
    return self;
}

- (id)initWithTitle:(NSString *)nTitle target:(id)nTarget action:(SEL)nAction{
    if (self = [self init]) {
        self.title = nTitle;
        self.target = nTarget;
        self.action = nAction;
        self.style = HYBarButtonItemStyleBordered;
        @try {
            NSArray *imgs = [self borderImages];
            if (imgs && imgs.count == 2) {
                if ([[imgs objectAtIndex:0] isKindOfClass:[UIImage class]]) {
                    self.img = [imgs objectAtIndex:0];
                }
                if ([[imgs objectAtIndex:1] isKindOfClass:[UIImage class]]) {
                    self.imgH = [imgs objectAtIndex:1];
                }
            }
        }
        @catch (NSException *exception) {
            self.img = nil;
            self.imgH = nil;
        }
    }
    return self;
}
- (id)initBackWithTarget:(id)nTarget action:(SEL)nAction{
    if (self = [self init]) {
        self.target = nTarget;
        self.action = nAction;
        self.style = HYBarButtonItemStyleBack;
        self.img =[UIImage imageNamed:@"nav_goback.png"];
        @try {
            NSArray *imgs = [self backImages];
            if (imgs && imgs.count == 2) {
                if ([[imgs objectAtIndex:0] isKindOfClass:[UIImage class]]) {
                    self.img = [imgs objectAtIndex:0];
                }
                if ([[imgs objectAtIndex:1] isKindOfClass:[UIImage class]]) {
                    self.imgH = [imgs objectAtIndex:1];
                }
            }
        }
        @catch (NSException *exception) {
            self.img = nil;
            self.imgH = nil;
        }
    }
    return self;
}

- (id)initWithCustomView:(UIView *)nCustomView{
    if (self = [self init]) {
        self.style = HYBarButtonItemStyleCustom;
        self.customView = nCustomView;
    }
    return self;
}

- (NSArray *)borderImages{
    return nil;
}

- (NSArray *)backImages{
    return nil;
}

@end
