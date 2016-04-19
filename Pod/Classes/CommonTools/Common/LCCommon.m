//
//  LCCommon.m
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import "LCCommon.h"

@implementation LCCommon

+ (NSInteger)getRandomValue:(NSInteger)maxValue
{
    NSInteger value = (arc4random() % maxValue);
    return value;
}

// 汉字转拼音
+ (NSString *)hanziToPinYin:(NSString *)hanzi
{
    if (hanzi && hanzi.length > 0) {
        
        unichar c = [hanzi characterAtIndex:0];
        if (c >= 0x4E00 && c <= 0x9FFF) {
            CFStringRef cfstring = (__bridge CFStringRef)hanzi;
            CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, cfstring);
            
            // 汉字转拼音
            CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
            
            // 去声调
            CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
            NSString *pinyin = (__bridge NSString *)string;
            
            // 去空格
            pinyin = [pinyin stringByReplacingOccurrencesOfString:@" " withString:@""];
            CFRelease(string);
            return pinyin;
        } else {
            // 非中文直接返回
            return hanzi;
        }
    }
    return nil;
}

+ (NSString *)getFirstLetterWithName:(NSString *)name
{
    if (name && name.length > 0) {
        unichar c = [name characterAtIndex:0];
        
        // 中文
        if (c >= 0x4E00 && c <= 0x9FFF) {
            CFStringRef cfstring = (__bridge CFStringRef)name;
            CFMutableStringRef string = CFStringCreateMutableCopy(NULL, 0, cfstring);
            CFStringTransform(string, NULL, kCFStringTransformMandarinLatin, NO);
            CFStringTransform(string, NULL, kCFStringTransformStripDiacritics, NO);
            NSString *nameString = (__bridge NSString *)string;
            
            NSString *firstLetter;
            if (nameString.length > 0) {
                firstLetter = [[nameString substringWithRange:NSMakeRange(0, 1)] uppercaseString];
            } else {
                firstLetter = @"#";
            }
            CFRelease(string);
            return firstLetter;
        } else { //英文
            return [[name substringWithRange:NSMakeRange(0, 1)] uppercaseString];
        }
        
    }
    return nil;
}

@end
