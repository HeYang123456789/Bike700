//
//  UIImageView+Common.h
//  Bike700
//
//  Created by HEYANG on 16/8/1.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (Common)

- (void)requestImageWithURLStr:(NSString*)urlStr;
- (void)requestImageWithURLStr:(NSString*)urlStr
              placeholderImage:(UIImage*)placeholderImage;

@end
