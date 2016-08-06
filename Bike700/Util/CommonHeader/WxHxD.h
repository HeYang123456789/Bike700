//
//  WxHxD.h
//  Bike700
//
//  Created by HEYANG on 16/4/3.
//  Copyright © 2016年 HEYANG. All rights reserved.
//


#pragma mark - 关于定义app开发常用尺寸

#ifndef WxHxD_h
#define WxHxD_h

// 边界
#define UIScreenBounds                     [UIScreen mainScreen].bounds

// 宽度
#define  UIScreenWidth                     [UIScreen mainScreen].bounds.size.width

// 高度
#define  UIScreenHeight                    [UIScreen mainScreen].bounds.size.height

// 屏幕横竖最大长度
#define ScreenMaxLength (MAX(UIScreenWidth, UIScreenHeight))
#define ScreenMinLength (MIN(UIScreenWidth, UIScreenHeight))

// 状态栏高度
#define  StatusBarHeight                   20.f

// 导航栏高度
#define  NavigationBarHeight               43.f

// 标签栏高度
#define  TabbarHeight                      49.f

// 状态栏高度 + 导航栏高度
#define  StatusBarAndNavigationBarHeight   (20.f + 44.f)

// 判断设备
#define isRetina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6p ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1472), [[UIScreen mainScreen] currentMode].size) : NO)


//////////////////////////////////////////////////

//@brief	矩形框.
#define GetFrameAll(x,y,w,h) CGRectMake((x), (y), (w), (h))
// @brief	坐标为(0, 0)的矩形框.
#define GetZeroPointFrameWithWH(w,h) GetFrameAll(0,0,w,h)
// @brief	完整填充frame的矩形框.
#define GetZeroPointFrameAllInset(frame) GetZeroPointFrameWithWH(frame.size.width,frame.size.height)
// @brief	以inset填充矩形框.
#define GetFrameInset(frame,inset) CGRectMake(inset.left, inset.top, frame.size.width - inset.left - inset.right, frame.size.height - inset.top - inset.bottom)

//////////////////////////////////////////////////



// 相关cell的左边距
#define kPaddingLeftWidth 15.0




#endif





