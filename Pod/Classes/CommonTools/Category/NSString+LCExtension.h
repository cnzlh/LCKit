//
//  NSString+LCExtension.h
//  LCKitDemo
//
//  Created by linhua on 15/11/4.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LCExtension)

/**
 *	@brief	删除给定字符串中所有空格
 *
 *	@return	删除空格后的字符串
 */
- (NSString *)stringByDeleteWhiteSpace;


/**
 *	@brief	判断中英文混合的字符长度 中文字符作为2个长度
 *
 */
- (NSInteger )stringLength;

/**
 *	@brief	得到中英文混合字符串长度 方法2
 */
- (NSInteger)calculateStringLength;

/**
 *  计算string的size大小
 */
- (CGSize)lc_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
@end
