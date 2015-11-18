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

/**
 *  缩放图片到指定大小
 *
 */
+ (UIImage *)thumbnailWithImage:(UIImage *)image size:(CGSize)newSize;

/**
 *  保持原来的长宽比，生成一个缩略图
 *
 */
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;

/**
 *  保持图像比例不变的同时调整其大小。需要根据图像的长宽比在其四周留出一些额外区域，用透明像素为图像消关。
 *
 */
+ (UIImage *) thumbnailWithImage:(UIImage *)image fitInSize:(CGSize) viewsize;

/**
 *  抽取部分图像来匹配可用空间。并裁剪掉落在像素区外的任何元素。
 *
 *  @return 返回居中的缩略图
 */
+ (UIImage *) thumbnailWithImage:(UIImage *)image centerInSize:(CGSize) viewsize;

/**
 *  通过匹配可用空间的长度和宽度来填充图像。每个像素都被使用，但是图像将水平或垂直裁剪
 *
 *  @return 返回填充的缩略图
 */
+ (UIImage *) thumbnailWithImage:(UIImage *)image fillInSize:(CGSize) viewsize;

/**
 *	@brief	按比例缩放图片
 *
 *	@param 	scaleRatio 	缩放比率
 */
- (UIImage *)scaleWithRatio:(CGFloat)scaleRatio;

/**
 *	@brief	image转换为String,可做为参数传递
 *
 */
- (NSString *)image2String;

/**
 *	@brief	高斯模糊
 *
 */
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;


@end
