//
//  HYNavItem.m
//  HYLibrary
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYNavItem.h"

@implementation HYNavItem
@synthesize title = _title;
@synthesize img = _img;
@synthesize titleColor = _titleColor;
@synthesize titleFont = _titleFont;
@synthesize imgOffset = _imgOffset;

- (id)init{
    if (self = [super init]) {
        _title = nil;
        _img = nil;
        _titleColor = [UIColor whiteColor];
        _titleFont = [UIFont systemFontOfSize:16.f];
    }
    return self;
}

- (id)initWithTitle:(NSString *)nTitle img:(UIImage *)nImg{
    if (self = [self init]) {
        _title = nTitle;
        _img = nImg;
    }
    return self;
}

- (id)initWithTitle:(NSString *)nTitle{
    if (self = [self init]) {
        _title = nTitle;
    }
    return self;
}

- (id)initWithImg:(UIImage *)nImg{
    if (self = [self init]) {
        _img = nImg;
    }
    return self;
}

@end
