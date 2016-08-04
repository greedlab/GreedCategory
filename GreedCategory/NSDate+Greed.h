//
//  NSDate+Greed.h
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Greed)

#pragma mark - get NSDate static

+ (NSDate *)gr_dateFromMilliSecond:(NSTimeInterval)milliSecond;
+ (NSDate *)gr_dateFromSecond:(NSTimeInterval)second;

+ (NSDate *)gr_dateFromYear:(NSInteger )year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second;
+ (NSDate *)gr_dateFromYear:(NSInteger )year month:(NSInteger)month day:(NSInteger)day;

+ (NSDate *)gr_beginDateWithYear:(NSInteger)year month:(NSInteger)month;
+ (NSDate *)gr_endDateWithYear:(NSInteger)year month:(NSInteger)month;
+ (NSDate *)gr_beginDateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;
+ (NSDate *)gr_endDateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

+ (NSDate *)gr_dateSince1970WithDays:(NSInteger)days;
+ (NSDate *)gr_dateSince1970WithMonths:(NSInteger)months day:(NSInteger)day;

/**
 *  2014-5-9 to NSDate
 *
 *  @param dateString 2014-5-9
 *
 *  @return NSDate
 */
+ (NSDate *)gr_dateWithDateString:(NSString *)string;

#pragma mark - get NSDate

- (NSDate *)gr_dateFromDiffYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second;
- (NSDate *)gr_dateFromDiffYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day;
- (NSDate *)gr_dateFromDiffWeekOfYear:(NSInteger)weekOfYear;
- (NSDate *)gr_dateWithNewHour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second;
- (NSDate *)gr_dateWithDiffSecond:(NSTimeInterval)second;

- (NSDate *)gr_firstDateOfYear;
- (NSDate *)gr_zeroDate;
- (NSDate *)gr_fullDate;

#pragma mark - get date info static

/**
 *  当前时间缀 毫秒
 */
+ (long long)gr_currentMilliSecond;

/**
 *  当前时间缀 秒
 */
+ (long long)gr_currentSecond;

#pragma mark - get date info

/**
 *  获取时间缀 毫秒
 */
- (long long)gr_milliSecond;

/**
 *  获取时间缀 秒
 */
- (long long)gr_second;
/**
 *  将NSDate => NSInteger
 *  2015年4月1日 => 20150401
 */
- (NSInteger)gr_intFormat;
/**
 *  获取指定月的天数
 */
+ (NSDate *)gr_dateFromIntFormat:(NSInteger)format;
- (NSInteger)gr_numberOfDaysInMonth;

/**
 *  获取星期几
 *
 *  @param weekBegnDay 0每周从周日起，1每周众周1起
 *
 *  @return 0每周第一天
 */
- (NSInteger)gr_weekWithWeekBeginDay:(NSInteger)weekBegnDay;

/**
 *  获取第几周
 *
 *  @param weekBegnDay 0每周从周日起，1每周众周1起
 *
 *  @return 第几周
 */
- (NSInteger)gr_weekOfYear:(NSInteger)weekBegnDay;

- (NSInteger)gr_year;
- (NSInteger)gr_month;
- (NSInteger)gr_day;
- (NSInteger)gr_hour;
- (NSString *)gr_week;

- (NSString *)gr_chineseMonth;
- (NSString *)gr_chineseDay;
- (NSString *)gr_chineseDayOrMonth;
- (NSString *)gr_chineseCalendar;

- (NSInteger)gr_daysSince1970;
- (NSInteger)gr_monthsSince1970;

/**
 *  年龄
 */
- (NSInteger)gr_age;

- (BOOL)gr_isDateBetweenBeginDate:(NSDate *)begin endDate:(NSDate *)end;

- (BOOL)gr_isYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

/**
 *  是否为本月
 */
- (BOOL)gr_isCurrentMonth;

#pragma mark - get NSDate format static

+ (NSString *)gr_formatTimeWithZeroDiffTime:(long long)zeroDiffTime;

/**
 *  距离开始时间还剩多长时间
 *
 *  @param currentTime 当时时间
 *  @param beginTime   开始时间
 *
 *  @return return value description
 */
+ (NSString *)gr_willBeginTimeStringWithCurrentTime:(long long)currentTime beginTime:(long long)beginTime;

/**
 *  距离结束时间还剩多长时间
 *
 *  @param currentTime 当前时间
 *  @param endTime     结束时间
 *
 *  @return return value description
 */
+ (NSString *)gr_willEndTimeStringWithCurrentTime:(long long)currentTime endTime:(long long)endTime;

/**
 *  从fromTime到toTime有多少天
 *  fromTime >= toTime 时返回nil
 *
 *  @param fromTime 起始时间(秒)
 *  @param toTime   结束时间(秒)
 *
 *  @return 从fromTime到toTime天数
 */
+ (NSString *)gr_diffDayFromTime:(long long)fromTime toTime:(long long)toTime;

/**
 *  获取时间区间
 *
 *  @param fromDateTime fromDateTime description
 *  @param toDateTime   toDateTime description
 *
 *  @return return fromDateTime ~ toDateTime
 */
+ (NSString *)gr_formatDateTimeForm:(long long)fromDateTime to:(long long)toDateTime;

#pragma mark - get NSDate format

/**
 *
 *  @return 上午 aaahh:mm
 */
- (NSString *)gr_formatTimeStr;
- (NSString *)gr_formatTimeStrTypeA;

/**
 *
 *  @return HH:mm:ss
 */
- (NSString *)gr_formatTimeStrTypeB;

/**
 *
 *  @return HH:mm
 */
- (NSString *)gr_formatTimeStrTypeC;

/**
 *  yyyy-MM-dd HH:mm
 */
- (NSString *)gr_formatDateTimeStr;
- (NSString *)gr_formatDateTimeStrTypeA;

/**
 *  MM-dd HH:mm:ss
 */
- (NSString *)gr_formatDateTimeStrTypeB;

/**
 *  MM-dd HH:mm
 */
- (NSString *)gr_formatDateTimeStrTypeC;
- (NSString *)gr_formatDateTimeStrTypeD;

/**
 *  @return yyyy-MM-dd HH:mm
 */
- (NSString *)gr_formatDateTimeStrTypeE;

- (NSString *)gr_formatYearAndMontchStr;
- (NSString *)gr_formatYearAndMontchStrTypeA;

/**
 *
 *  @return yyyy-MM-dd
 */
- (NSString *)gr_formatDateStr;

/**
 *  @return yyyy年MM月dd日
 */
- (NSString *)gr_formatDateStrTypeA;

/**
 *  @return yyyy.MM.dd
 */
- (NSString *)gr_formatDateStrTypeB;

/**
 *  获取日期时间字符串
 *
 *  @return yyyy-MM-dd HH:mm:ss OR MM-dd HH:mm:ss OR HH:mm:ss
 */
- (NSString *)gr_autoFormatDateAndTimeStr;

/**
 *  获取日期时间字符串
 *
 *  @return yyyy-MM-dd HH:mm OR MM-dd HH:mm
 */
- (NSString *)gr_autoFormatDateAndTimeStrTypeA;

/**
 *  获取日期时间字符串
 *  yyyy-MM-dd OR MM-dd HH:mm OR HH:mm:ss
 */
- (NSString *)gr_autoFormatDateAndTimeStrTypeB;

/**
 *  获取日期时间字符串
 *  yyyy-MM-dd OR MM-dd HH:mm OR HH:mm
 */
- (NSString *)gr_autoFormatDateAndTimeStrTypeC;

- (NSString *)gr_formatDateAndWeekString;

- (NSString *)gr_formatIntervalToDate:(NSDate *)toDate;
- (NSString *)gr_formatInterval;

@end
