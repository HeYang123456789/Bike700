//
//  HYBarItem.m
//  HYLibrary
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYBarItem.h"

@implementation HYBarItem
@synthesize enabled = _enabled;
@synthesize title = _title;
@synthesize img = _img;
@synthesize imgH = _imgH;
@synthesize imgBg = _imgBg;
@synthesize imgBgH = _imgBgH;
@synthesize titleColor = _titleColor;
@synthesize titleColorH = _titleColorH;
@synthesize titleFont = _titleFont;
@synthesize contentInset = _contentInset;


- (id)init{
    if (self = [super init]) {
        self.enabled = YES;
        self.title = nil;
        self.img = nil;
        self.imgH = nil;
        self.imgBg = nil;
        self.imgBgH = nil;
        self.titleColor = [UIColor whiteColor];
        self.titleColorH = [UIColor whiteColor];
        self.titleFont = [UIFont systemFontOfSize:17.f];
        self.contentInset = UIEdgeInsetsZero;
        
        self.strokeColor =[UIColor darkTextColor];
        self.strokeWidth =0;
        self.edgeStroke =HYEdgeStrokeNone;
    }
    return self;
}

@end
