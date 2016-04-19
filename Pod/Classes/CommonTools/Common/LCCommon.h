//
//  LCCommon.h
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>

@interface LCCommon : NSObject

/**
 *	@brief	获取随机整型值
 *
 *	@param 	maxValue 	随机最大值(不包括)
 *
 *	@return	随机整数
 */
+ (NSInteger)getRandomValue:(NSInteger)maxValue;

// 汉字转拼音 如张三 返回zhangsan
+ (NSString *)hanziToPinYin:(NSString *)hanzi;

// 获取汉字的首字母大写 如张三 返回Z
+ (NSString *)getFirstLetterWithName:(NSString *)name;

@end
