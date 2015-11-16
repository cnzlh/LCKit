//
//  NSString+RegEx.m
//  Pods
//
//  Created by linhua on 15/11/16.
//
//

#import "NSString+RegEx.h"

@implementation NSString (RegEx)

- (BOOL)isEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [pred evaluateWithObject:self];
}

- (BOOL)isNumber{
    NSString *numberRegex = @"[0-9]+";
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    BOOL isMatch = [numberTest evaluateWithObject:self];
    if (!isMatch) {
        return NO;
    }
    return YES;
}

@end
