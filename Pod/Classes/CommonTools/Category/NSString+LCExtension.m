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

@end
