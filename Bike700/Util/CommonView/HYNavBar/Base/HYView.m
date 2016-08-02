//
//  HYView.m
//  NavigationBar
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYView.h"

#import <QuartzCore/QuartzCore.h>

// 这个就是一个拓展的私有类别
@interface HYView (HYLibraryPrivate)

/**
 *	@brief	初始化视图
 */
- (void)initView;

@end


@implementation HYView
@synthesize userinfo = _userinfo;
@synthesize inset = _inset;

#pragma mark - lifecycle


- (id)init{
    self = [self initWithFrame:CGRectZero];
    if (self) {
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _userinfo = nil;
        _inset = UIEdgeInsetsZero;
        [self setBackgroundColor:[UIColor clearColor]];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

#pragma mark - Public

- (void)borderShow{
    [self borderShow:[UIColor blackColor]];
}

- (void)borderShow:(UIColor *)borderColor{
    [self borderShow:borderColor width:1.f];
}

- (void)borderShow:(UIColor *)broderColor width:(CGFloat)borderWidth{
    [self.layer setBorderColor:broderColor.CGColor];
    [self.layer setBorderWidth:borderWidth];
}

#pragma mark - Private
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
//{
//
//    if ([self pointInside:point withEvent:event]) {
//        return self.receiver;
//    }
//    return nil;
//}
@end
