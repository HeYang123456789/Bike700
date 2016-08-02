//
//  UITextField+Common.m
//  Bike700
//
//  Created by HEYANG on 16/8/2.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "UITextField+Common.h"

@implementation UITextField (Common)

- (void)setPlaceholderTextWhite{
    [self setPlaceholderTextColor:[UIColor whiteColor]];
}

- (void)setPlaceholderTextColor:(UIColor*)textColor{
    UILabel *placeholderLabel = [self valueForKeyPath:@"placeholderLabel"];
    placeholderLabel.textColor = textColor;
}

@end
