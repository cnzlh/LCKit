//
//  NSString+LCExtension.m
//  LCKitDemo
//
//  Created by linhua on 15/11/4.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import "NSString+LCExtension.h"

@implementation NSString (LCExtension)

- (NSString *)stringByDeleteWhiteSpace{
    NSString *whiteSpace = @" ";
    return [self stringByReplacingOccurrencesOfString:whiteSpace withString:@""];
}

- (NSInteger )stringLength {
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSData* da = [self dataUsingEncoding:enc];
    //    NSLog(@"%ld",(long)[da length]);
    return[da length];
}

- (NSInteger)calculateStringLength {
    NSInteger strlength = 0;
    char* p = (char*)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    return strlength;
}

- (CGSize)lc_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    CGSize textSize;
    if (CGSizeEqualToSize(size, CGSizeZero))
    {
        //            NSDictionary *attributes = @{NSFontAttributeName:font}
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        //            textSize = [self sizeWithAttributes:attributes];
        //            textSize = []
        
        textSize = [self sizeWithAttributes:attributes];
    }
    else
    {
        NSStringDrawingOptions option = NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        //NSStringDrawingTruncatesLastVisibleLine如果文本内容超出指定的矩形限制，文本将被截去并在最后一个字符后加上省略号。 如果指定了NSStringDrawingUsesLineFragmentOrigin选项，则该选项被忽略 NSStringDrawingUsesFontLeading计算行高时使用行间距。（译者注：字体大小+行间距=行高）
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:size
                                         options:option
                                      attributes:attributes
                                         context:nil];
        
        textSize = rect.size;
    }
    return textSize;
}

@end
