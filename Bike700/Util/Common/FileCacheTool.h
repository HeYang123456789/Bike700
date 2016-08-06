//
//  FileCacheTool.m
//  Bike700
//
//  Created by HEYANG on 16/6/2.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  文件缓存处理工具类
 */

@interface FileCacheTool : NSObject

+ (void)removeDirectoriesPath:(NSString *)directoriesPath complement:(void(^)(void))complement;
/**
 *  计算文件夹的尺寸
 *
 *  @param directoriesPath 文件路径
 *  @param completeBlock   计算完之后回调
 */
+ (void)getCacheSizeOfDirectoriesPath:(NSString *)directoriesPath completeBlock:(void(^)(NSInteger))completeBlock;

@end


// 下面需要在程序中处理，或者在这个工具类中添加一个工厂方法
/**
 // 清除UIWebView的缓存
 [[NSURLCache sharedURLCache] removeAllCachedResponses];
 
 // 删除cache缓存
 // 获取cache文件夹路径
 NSString *cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
 */