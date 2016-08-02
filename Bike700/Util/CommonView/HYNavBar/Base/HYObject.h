//
//  HYObject.h
//  NavigationBar
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *	@brief	Object 基类.
 */
@interface HYObject : NSObject{
@private
    id _userinfo;
}

/**
 *	@brief	自定义数据.
 */
@property (nonatomic, strong) id userinfo;

/**
 *	@brief	实例属性字典, 不包括父类.
 *
 *	@return	属性及属性值数据字典.
 */
- (NSDictionary *)toDict;

@end
