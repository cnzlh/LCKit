//
//  UIView+LCExtension.h
//  LCKitDemo
//
//  Created by linhua on 15/11/12.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LCExtension)

/**
 *  打印view层次结构和frame
 */
- (void)printViewHierarchy;

/**
 *  生成纯色的小圆点
 *
 */
+ (UIView *) dotView:(CGRect)frame WithColor:(UIColor *)color;

@end
