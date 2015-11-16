//
//  UIImage+LCExtension.h
//  LCKitDemo
//
//  Created by linhua on 15/11/3.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (LCExtension)

/**
 *  生成相应颜色的纯色图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;

/**
 *	@brief	截取部分图像
 *
 *	@param 	rect  需要截取的Frame
 *
 *	@return	截取后的图片
 */
-(UIImage*)getSubImage:(CGRect)rect;

@end
