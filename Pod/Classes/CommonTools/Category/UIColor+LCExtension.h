//
//  UIColor+LCExtension.h
//  LCKitDemo
//
//  Created by linhua on 15/11/3.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (LCExtension)

/**
 *  获取随机颜色
 */
+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha;

/**
 *  从UIColor获取16进制颜色值
 *
 */
+ (NSString *) hexFromUIColor: (UIColor*) color;

@end
