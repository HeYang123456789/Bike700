//
//  NSString+UIUtil.h
//  Bike700
//
//  Created by HEYANG on 16/7/24.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (UIUtil)

/**
 *  在给定的有限的最大的范围MaxSize内计算文本的Size
 */
- (CGSize)getSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;


@end
