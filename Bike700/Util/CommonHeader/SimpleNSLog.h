//
//  SimpleNSLog.h
//  Bike700
//
//  Created by HEYANG on 16/4/3.
//  Copyright © 2016年 HEYANG. All rights reserved.
//

// 宏定义打印 并设置了一些Debug模式
//////////////////

#ifndef SIMPLE_NSLOG_H
#define SIMPLE_NSLOG_H

#import <Foundation/Foundation.h>
#import <asl.h>


#define THIS_FILE [(@"" __FILE__) lastPathComponent]


#define _HYNSLog(fmt,...) {                                             \
  do                                                                  \
  {                                                                   \
    NSString *str = [NSString stringWithFormat:fmt, ##__VA_ARGS__];   \
    printf("%s\n",[str UTF8String]);                                  \
    asl_log(NULL, NULL, ASL_LEVEL_NOTICE, "%s", [str UTF8String]);    \
  }                                                                   \
  while (0);                                                          \
}


#define HYNSLog(fmt, ...) _HYNSLog((@"%@:%d %s " fmt), THIS_FILE, __LINE__, __FUNCTION__, ##__VA_ARGS__)

// 使用Dlog打印，Debug模式下打印，上线版非Debug模式就会替换为 无

#ifdef DEBUG
#define DLog(fmt, ...) _HYNSLog((@"%@:%d %s " fmt),    \
          THIS_FILE,                                 \
          __LINE__,                                  \
          __FUNCTION__,                              \
          ##__VA_ARGS__)
#else
    #define DLog(...)
#endif


#endif