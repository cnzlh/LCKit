//
//  NSString+RegEx.h
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import <Foundation/Foundation.h>

@interface NSString (RegEx)

/**
 *  验证邮箱
 */
- (BOOL)isEmail;

/**
 *  验证是否是数字
 */
- (BOOL)isNumber;

@end
