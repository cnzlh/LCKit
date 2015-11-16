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

@end
