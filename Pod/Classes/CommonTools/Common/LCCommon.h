//
//  LCCommon.h
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import <Foundation/Foundation.h>

@interface LCCommon : NSObject

/**
 *	@brief	获取随机整型值
 *
 *	@param 	maxValue 	随机最大值(不包括)
 *
 *	@return	随机整数
 */
+ (NSInteger)getRandomValue:(NSInteger)maxValue;

@end
