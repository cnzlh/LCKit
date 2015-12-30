//
//  NSDate+LCExtension.h
//  LCKitDemo
//
//  Created by linhua on 15/11/4.
//  Copyright © 2015年 linhua. All rights reserved.
//

#import <Foundation/Foundation.h>

#define D_MINUTE	60
#define D_HOUR		3600
#define D_DAY		86400
#define D_WEEK		604800
#define D_YEAR		31556926

@interface NSDate (LCExtension)

/**
 *  生成yyyy-MM-dd HH:mm:ss zzz格式的字符串
 *
 *  @return 输入的日期字符串形如“2015-01-27 09:47:51 GMT+8”
 */
- (NSString *) stringFormDate;

/**
 *  生成自定义格式的日期字符串
 *
 *  @param format 自定义格式如@"yyyyMMdd"
 *
 *  @return 输入的日期字符串形如“20150127”
 */
- (NSString *) stringFormDateWithFormat:(NSString *)format;

/**
 *  将日期字符串转化为NSDate对象
 *
 *  @param string 需要转化的日期字符串
 *  @param format 与日期字符串相匹配的格式
 *
 *  @return 生成的日期对象
 */
+ (NSDate *) dateFromString:(NSString *)dateString withFormat:(NSString *)format;

/**
 *  给定一个时间，给一个数，正数是后n个月以，负数是前n个月
 *
 *  @param date  给定的日期对象
 *  @param month 返回日期的月份差
 *
 *  @return 返回n个月之前或之后对应的日期
 */
+ (NSDate *) getPreviousOrLaterDateFromDate:(NSDate *)date withMonth:(NSInteger)month;

/**
 *  获取n个月之前或之后的某天所在的月的第一天
 *
 *  @param date  给定的日期
 *  @param month 月份差值
 *
 *  @return n个月之前或之后的某天所在的月的第一天的日期对象
 */
+ (NSDate *) theFirstDayFromDate:(NSDate *)date withMonth:(NSInteger)month;

/**
 *  获取n个月之前或之后的某天所在的月的最后一天
 *
 *  @param date  给定的日期
 *  @param month 月份差值
 *
 *  @return n个月之前或之后的某天所在的月的最后一天的日期对象
 */
+ (NSDate *) theLastDayFromDate:(NSDate *)date withMonth:(NSInteger)month;

/**
 *  判断当前时间是否是晚上
 *
 *  @param aDate 给定的时间
 *
 *  @return 下午6点到晚上24点，上午0点至6点返回YES
 */
+ (BOOL)isNight:(NSDate *)aDate;

/**
 *  获取星期几
 *
 *  @return 返回日期字符串形如@“Tuesday January 27, 2015”
 */
- (NSString *)getWeekDay;


// Relative dates from the current date
+ (NSDate *) dateTomorrow;
+ (NSDate *) dateYesterday;
+ (NSDate *) dateWithDaysFromNow: (NSInteger) days;
+ (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
+ (NSDate *) dateWithHoursFromNow: (NSInteger) dHours;
+ (NSDate *) dateWithHoursBeforeNow: (NSInteger) dHours;
+ (NSDate *) dateWithMinutesFromNow: (NSInteger) dMinutes;
+ (NSDate *) dateWithMinutesBeforeNow: (NSInteger) dMinutes;

// Comparing dates
- (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;
- (BOOL) isToday;
- (BOOL) isTomorrow;
- (BOOL) isYesterday;
- (BOOL) isSameWeekAsDate: (NSDate *) aDate;
- (BOOL) isThisWeek;
- (BOOL) isNextWeek;
- (BOOL) isLastWeek;
- (BOOL) isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) isThisMonth;
- (BOOL) isSameYearAsDate: (NSDate *) aDate;
- (BOOL) isThisYear;
- (BOOL) isNextYear;
- (BOOL) isLastYear;
- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;
- (BOOL) isInFuture;
- (BOOL) isInPast;
+ (NSString *)timeDifferenceInSeconds:(NSInteger)seconds; //将秒数转成时间差（xx天xx小时xx分xx秒）

// Date roles
- (BOOL) isTypicallyWorkday;
- (BOOL) isTypicallyWeekend;

// Adjusting dates
- (NSDate *) dateByAddingDays: (NSInteger) dDays;
- (NSDate *) dateBySubtractingDays: (NSInteger) dDays;
- (NSDate *) dateByAddingHours: (NSInteger) dHours;
- (NSDate *) dateBySubtractingHours: (NSInteger) dHours;
- (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;
- (NSDate *) dateAtStartOfDay;

// Retrieving intervals
- (NSInteger) minutesAfterDate: (NSDate *) aDate;
- (NSInteger) minutesBeforeDate: (NSDate *) aDate;
- (NSInteger) hoursAfterDate: (NSDate *) aDate;
- (NSInteger) hoursBeforeDate: (NSDate *) aDate;
- (NSInteger) daysAfterDate: (NSDate *) aDate;
- (NSInteger) daysBeforeDate: (NSDate *) aDate;
- (NSInteger) distanceInDaysToDate:(NSDate *)anotherDate;

// Decomposing dates
@property (readonly) NSInteger nearestHour;
@property (readonly) NSInteger hour;
@property (readonly) NSInteger minute;
@property (readonly) NSInteger seconds;
@property (readonly) NSInteger day;
@property (readonly) NSInteger month;
@property (readonly) NSInteger week;
@property (readonly) NSInteger weekday;
@property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
@property (readonly) NSInteger year;



@end
