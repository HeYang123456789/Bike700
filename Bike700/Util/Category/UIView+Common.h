//
//  UIView+Common.h
//  Bike700
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Common)

@property (nonatomic) IBInspectable UIColor *borderColor;
@property (nonatomic) IBInspectable CGFloat borderWidth;
@property (nonatomic) IBInspectable CGFloat cornerRadius;
@property (nonatomic) IBInspectable BOOL masksToBounds;

- (void)doCircleFrame;
- (void)doCircleNoBorderFrame;
- (void)doNotCircleFrame;
- (void)doBorderWidth:(CGFloat)width color:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;


@end
