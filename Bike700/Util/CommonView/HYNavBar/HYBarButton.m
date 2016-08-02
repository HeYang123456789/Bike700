//
//  MainTabBarController.m
//  Bike700
//
//  Created by HEYANG on 16/7/22.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYBarButton.h"




@implementation HYBarButton
@synthesize item = _item;
@synthesize textInset = _textInset;
@synthesize imageInset =_imageInset;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor clearColor]];
        
        _barButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_barButton setFrame:GetZeroPointFrameAllInset(frame)];
        [_barButton setBackgroundColor:[UIColor clearColor]];
        [_barButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
        [_barButton setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_barButton addTarget:self action:@selector(barClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_barButton];
    }
    return self;
}

- (id)initWithItem:(HYBarButtonItem *)nItem{
    if (self = [self initWithFrame:CGRectZero]) {
        _item = nItem;
    }
    return self;
}

-(void)setItem:(HYBarButtonItem *)item{

    _item =item;
    
    [self setNeedsLayout];
}
// 对于一个自定义控件需要设置的属性，可以画出一个思维导图来表示
-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect frame = self.frame;
    if (self.item) {
        /*
         *使用边框填充视图
         */
        [_barButton setFrame:GetFrameInset(frame, self.inset)];
        //自定视图按钮
        if (self.item.style == HYBarButtonItemStyleCustom) {
            if (self.item.customView) {
                /*视图依赖判断,是否在当前视图上*/
                // 不在就添加
                if (![self.item.customView isDescendantOfView:self]) {
                    [self addSubview:self.item.customView];
                }
                /*填充矩形框*/
                [self.item.customView setFrame:GetFrameInset(frame, self.inset)];
            }
        }//普通按钮
        else if (self.item.style == HYBarButtonItemStyleBordered){
            
            if (self.item.customView) {
                if ([self.item.customView isDescendantOfView:self]) {
                    [self.item.customView removeFromSuperview];
                }
            }
            /*设置按钮填充参数*/
            [_barButton setContentEdgeInsets:self.inset];
            if (!IOS7_OR_LATER) {
                //ios7及以后，不使用图片，仅仅是"文字按钮"
                /*设置按钮背景图片 两种状态*/
                [_barButton setBackgroundImage:self.item.img forState:UIControlStateNormal];
                [_barButton setBackgroundImage:self.item.imgH forState:UIControlStateHighlighted];
            }
            else
            {
                [_barButton setImage:self.item.img forState:UIControlStateNormal];
                [_barButton setImage:self.item.imgH forState:UIControlStateHighlighted];
                //40  视实际情况而定
                [_barButton setImageEdgeInsets:self.imageInset];
            }
            /*设置两种状态的标题，防止某种状态下，标题遗失*/
            [_barButton setTitle:self.item.title forState:UIControlStateNormal];
            [_barButton setTitle:self.item.title forState:UIControlStateHighlighted];
            /*设置两种状态下标题颜色*/
            [_barButton setTitleColor:self.item.titleColor forState:UIControlStateNormal];
            [_barButton setTitleColor:self.item.titleColorH forState:UIControlStateHighlighted];
            /*设置标题字体，可在item初始化时给出*/
            [_barButton.titleLabel setFont:self.item.titleFont];
        }//返回按钮
        else if (self.item.style == HYBarButtonItemStyleBack){            
            if (self.item.customView) {
                if ([self.item.customView isDescendantOfView:self]) {
                    [self.item.customView removeFromSuperview];
                }
            }
            /*设置按钮填充参数*/
            [_barButton setContentEdgeInsets:self.inset];
            [_barButton setImageEdgeInsets:self.imageInset];
            //使用定制图片，和订制是"文字按钮"
            //[_barButton setTitle:@"返回" forState:UIControlStateNormal];
            [_barButton setImage:self.item.img forState:UIControlStateNormal];
            [_barButton setImage:self.item.imgH forState:UIControlStateHighlighted];
            if (!IOS7_OR_LATER) {
                /*非ios7及以后,设置两种状态的标题，防止某种状态下，标题遗失*/
                [_barButton setTitle:self.item.title forState:UIControlStateNormal];
                [_barButton setTitle:self.item.title forState:UIControlStateHighlighted];
            }
            /*设置两种状态下标题颜色*/
            [_barButton setTitleColor:self.item.titleColor forState:UIControlStateNormal];
            [_barButton setTitleColor:self.item.titleColorH forState:UIControlStateHighlighted];
            /*设置标题字体，可在item初始化时给出*/
            [_barButton.titleLabel setFont:self.item.titleFont];
        }
    }
}
#pragma mark - Selector
- (void)barClick:(id)sender{
    if (self.item.target) {
        if ([self.item.target respondsToSelector:self.item.action]) {
            [self.item.target performSelector:self.item.action withObject:self];
        }
    }
}

@end
