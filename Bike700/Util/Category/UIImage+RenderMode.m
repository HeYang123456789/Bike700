//
//  UIImage+RenderMode.m
//  huotun
//
//  Created by HEYANG on 16/4/3.
//  Copyright © 2016年 HEYANG. All rights reserved.
//

#import "UIImage+RenderMode.h"

@implementation UIImage (RenderMode)

+ (UIImage *)imageRenderingModeImageNamed:(NSString *)imageName
{
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}

@end
