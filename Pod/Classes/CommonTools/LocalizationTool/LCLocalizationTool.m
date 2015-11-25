//
//  LCLocalizationTool.m
//  MochuiRouter
//
//  Created by linhua on 15/11/25.
//  Copyright © 2015年 matrix. All rights reserved.
//

#import "LCLocalizationTool.h"

static NSBundle *bundle = nil;

@implementation LCLocalizationTool

+ (NSBundle *)bundle {
    return bundle;
}

+ (void)initUserLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
//    NSLog(@"%@",[def dictionaryRepresentation]);
    
    NSString *string = [def valueForKey:USER_LANGUAGE];
    if(string.length == 0){
        //获取系统当前语言版本
        NSArray* languages = [def objectForKey:@"AppleLanguages"];
        NSString *current = [languages objectAtIndex:0];
        string = current;
        [def setValue:current forKey:USER_LANGUAGE];
        [def synchronize];//持久化
    }

    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    NSLog(@"%@",path);
    
    bundle = [NSBundle bundleWithPath:path];//生成bundle
}

+ (NSString *)userLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:USER_LANGUAGE];
    return language;
}

+ (void)setUserlanguage:(NSString *)language{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];
    
    //2.持久化
    [def setValue:language forKey:USER_LANGUAGE];
    [def synchronize];
}

@end
