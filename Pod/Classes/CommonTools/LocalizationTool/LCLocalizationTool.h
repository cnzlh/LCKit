//
//  LCLocalizationTool.h
//
//  Created by linhua on 15/11/25.
//  Copyright © 2015年 matrix. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CHINESE @"zh-Hans"
#define ENGLISH @"en"
#define USER_LANGUAGE @"userLanguage"

#define LCLocalizedString(key) [[LCLocalizationTool bundle] localizedStringForKey:(key) value:@"" table:nil]

@interface LCLocalizationTool : NSObject

+ (NSBundle *)bundle;//获取当前资源文件

+ (void)initUserLanguage;//初始化语言文件

+ (NSString *)userLanguage;//获取应用当前语言

+ (void)setUserlanguage:(NSString *)language;//设置当前语言

@end
