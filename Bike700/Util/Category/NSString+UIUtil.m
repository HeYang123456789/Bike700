//
//  NSString+UIUtil.m
//  Bike700
//
//  Created by HEYANG on 16/7/24.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "NSString+UIUtil.h"

@implementation NSString (UIUtil)

- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    CGSize resultSize = CGSizeZero;
    if (self.length <= 0) {
        return resultSize;
    }
    resultSize = [self boundingRectWithSize:size
                                    options:(NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin)
                                 attributes:@{NSFontAttributeName: font}
                                    context:nil].size;
    resultSize = CGSizeMake(MIN(size.width, ceilf(resultSize.width)), MIN(size.height, ceilf(resultSize.height)));
    return resultSize;
}

@end
