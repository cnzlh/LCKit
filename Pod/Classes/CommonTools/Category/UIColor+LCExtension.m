//
//  UIColor+LCExtension.m
//  LCKitDemo
//
//  Created by linhua on 15/11/3.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import "UIColor+LCExtension.h"

@implementation UIColor (LCExtension)


+ (UIColor *)randomColorWithAlpha:(CGFloat)alpha {
    static BOOL seed = NO;
    if (!seed) {
        seed = YES;
        srandom((unsigned)time(NULL));
    }
    CGFloat red = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];//alpha为1.0,颜色完全不透明
}

+ (NSString *) hexFromUIColor: (UIColor *) color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    
    return [NSString stringWithFormat:@"#%02lX%02lX%02lX",
            lroundf(r * 255),
            lroundf(g * 255),
            lroundf(b * 255)];
}


@end
