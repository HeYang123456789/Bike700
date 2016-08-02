//
//  UIImageView+Common.m
//  Bike700
//
//  Created by HEYANG on 16/8/1.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "UIImageView+Common.h"

@implementation UIImageView (Common)

- (void)requestImageWithURLStr:(NSString*)urlStr{
    [self requestImageWithURLStr:urlStr placeholderImage:nil];
}

- (void)requestImageWithURLStr:(NSString*)urlStr
              placeholderImage:(UIImage*)placeholderImage{
    NSURL *imageURL = [NSURL URLWithString:urlStr];
    [self sd_setImageWithURL:imageURL placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
    }];
}

@end
