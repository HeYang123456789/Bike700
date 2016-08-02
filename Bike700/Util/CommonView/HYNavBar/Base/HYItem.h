//
//  HYItem.h
//  NavigationBar
//
//  Created by HEYANG on 16/7/23.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "HYObject.h"

/**
 *	@brief	视图数据项.
 */
@interface HYItem : HYObject{
@private
    NSInteger _tag;
}
/**
 *	@brief	标签.
 */
@property (nonatomic, assign) NSInteger tag;


@end
