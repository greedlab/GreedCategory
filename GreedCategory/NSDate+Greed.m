//
//  NSDate+Greed.m
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "NSDate+Greed.h"

@implementation NSDate (Greed)

#pragma mark - get NSDate static

+ (NSDate *)gr_dateFromMilliSecond:(NSTimeInterval)milliSecond
{
    return [NSDate dateWithTimeIntervalSince1970:milliSecond/1000.f];
}

+ (NSDate *)gr_dateFromSecond:(NSTimeInterval)second
{
    return [NSDate dateWithTimeIntervalSince1970:second];
}

+ (NSDate *)gr_dateFromYear:(NSInteger )year month:(NSInteger)month day:(NSInteger)day hour:(NSInteger)hour minute:(NSInteger)minute second:(NSInteger)second
{
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    
    [comps setYear:year];
    [comps setMonth:month];
    [comps setDay:day];
    [comps setHour:hour];
    [comps setMinute:minute];
    [comps setSecond:second];
    NSDate *returnDate = [calendar dateFromComponents:comps];
    
    return returnDate;
}

+ (NSDate *)gr_dateFromYear:(NSInteger )year month:(NSInteger)month day:(NSInteger)day
{
    return [NSDate gr_dateFromYear:year month:month day:day hour:8 minute:0 second:0];
}

+ (NSDate *)gr_beginDateWithYear:(NSInteger)year month:(NSInteger)month
{
    return [NSDate gr_dateFromYear:year month:month day:1 hour:0 minute:0 second:0];
}

+ (NSDate *)gr_endDateWithYear:(NSInteger)year month:(NSInteger)month
{
    if (month == 12) {
        return [NSDate gr_dateFromYear:(year + 1) month:1 day:1 hour:0 minute:0 second:0];
    } else {
        return [NSDate gr_dateFromYear:year month:(month + 1 ) day:1 hour:0 minute:0 second:0];
    }
}

+ (NSDate *)gr_beginDateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    return [NSDate gr_dateFromYear:year month:month day:day hour:0 minute:0 second:0];
}

+ (NSDate *)gr_endDateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day
{
    return [NSDate gr_dateFromYear:year month:month day:day hour:23 minute:59 second:59];
}

+ (NSDate *)gr_dateSince1970WithDays:(NSInteger)days
{
    NSTimeInterval seconds = days * 60 * 60 *24;
    return [NSDate dateWithTimeIntervalSince1970:seconds];
}

+ (NSDate *)gr_dateSince1970WithMonths:(NSInteger)months day:(NSInteger)day
{
    NSInteger year = 1970 +  months / 12;
    NSInteger month = 1 + months % 12;
    
    return [NSDate gr_dateFromYear:year month:month day:day hour:0 minute:0 second:0];
}

+ (NSDate *)gr_dateWithDateString:(NSString *)string {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setCalendar:[NSCalendar calendarWithIdentifier:NSGregorianCalendar]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:string];
    return date;
}

#pragma mark - get NSDate

- (NSDate *)gr_dateFromDiffYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day hour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    [adcomps setHour:hour];
    [adcomps setMinute:minute];
    [adcomps setSecond:second];
    
    return  [calendar dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)gr_dateFromDiffYear:(NSUInteger)year month:(NSUInteger)month day:(NSUInteger)day
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    
    return  [calendar dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)gr_dateFromDiffWeekOfYear:(NSInteger)weekOfYear
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setWeekOfYear:weekOfYear];
    
    return  [calendar dateByAddingComponents:adcomps toDate:self options:0];
}

- (NSDate *)gr_firstDateOfYear
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    
    [comps setMonth:1];
    [comps setDay:1];
    
    return [calendar dateFromComponents:comps];
}

- (NSDate *)gr_zeroDate
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    [comps setHour:0];
    [comps setMinute:0];
    [comps setSecond:0];
    return [calendar dateFromComponents:comps];
}

- (NSDate *)gr_dateWithNewHour:(NSUInteger)hour minute:(NSUInteger)minute second:(NSUInteger)second
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    [comps setHour:hour];
    [comps setMinute:minute];
    [comps setSecond:second];
    NSDate *returnDate = [calendar dateFromComponents:comps];
    return returnDate;
}

- (NSDate *)gr_dateWithDiffSecond:(NSTimeInterval)second
{
    return [[NSDate alloc] initWithTimeInterval:second sinceDate:self];
}

- (NSDate *)gr_fullDate
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    [comps setHour:23];
    [comps setMinute:59];
    [comps setSecond:59];
    NSDate *returnDate = [calendar dateFromComponents:comps];
    return returnDate;
}

#pragma mark - get date info static

+ (long long)gr_currentMilliSecond
{
    return [[NSDate date] timeIntervalSince1970] * 1000;
}

+ (long long)gr_currentSecond
{
    return [[NSDate date] timeIntervalSince1970];
}

#pragma mark - get date info

- (long long)gr_milliSecond
{
    return [self timeIntervalSince1970] * 1000;
}

- (long long)gr_second
{
    return [self timeIntervalSince1970];
}

- (NSInteger)gr_numberOfDaysInMonth
{
    NSCalendar *calendarmonth = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSRange range = [calendarmonth rangeOfUnit:NSDayCalendarUnit inUnit:NSMonthCalendarUnit forDate:self];
    return range.length;
}

- (NSInteger)gr_sundayBeginWeek
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *componets = [greCalendar components:NSWeekdayCalendarUnit fromDate:self];
    NSInteger weekday = [componets weekday];
    return weekday;
}

- (NSInteger)gr_mondayBeginWeek
{
    NSInteger weekday = [self gr_sundayBeginWeek];
    if (weekday == 1) {
        weekday = 7;
    } else {
        weekday --;
    }
    return weekday;
}

- (NSInteger)gr_weekWithWeekBeginDay:(NSInteger)weekBegnDay
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *componets = [greCalendar components:NSWeekdayCalendarUnit fromDate:self];
    
    // 1-> 7 :天->1
    NSInteger weekday = [componets weekday];
    weekday --;
    if (weekday >= weekBegnDay) {
        weekday -= weekBegnDay;
    } else {
        weekday = weekday + 7 - weekBegnDay;
    }
    return weekday ;
}

- (NSInteger)gr_weekOfYear:(NSInteger)weekBegnDay
{
    if (/* DISABLES CODE */ (0)) {
        // 用系统的方法获取的结果有一周的偏差
        
        NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *dateComponents = [greCalendar components:NSYearCalendarUnit | NSWeekOfYearCalendarUnit  fromDate:self];
        return dateComponents.weekOfYear;
    } else {
        NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDateComponents *dateComponents = [greCalendar components:NSMonthCalendarUnit | NSDayCalendarUnit  fromDate:self];
        NSInteger totalDays = dateComponents.day;
        for (NSInteger month = dateComponents.month - 1; month > 0; month --) {
            NSDate *newDate = [self gr_dateFromDiffYear:0 month:-month day:0];
            totalDays += [newDate gr_numberOfDaysInMonth];
        }
        NSDate *firstDateOfYear = [self gr_firstDateOfYear];
        NSInteger weekDay = [firstDateOfYear gr_weekWithWeekBeginDay:weekBegnDay];
        return totalDays <= (7 - weekDay) ? 1 : ((totalDays + weekDay - 1) / 7 + 1 );
    }
}

- (NSInteger)gr_year
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSYearCalendarUnit fromDate:self];
    return dateComponents.year;
}

- (NSInteger)gr_month
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSMonthCalendarUnit fromDate:self];
    return dateComponents.month;
}

- (NSInteger)gr_day
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSDayCalendarUnit fromDate:self];
    return dateComponents.day;
}

- (NSInteger)gr_hour
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [greCalendar components:NSHourCalendarUnit fromDate:self];
    return dateComponents.hour;
}

- (NSString *)gr_week
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlags = NSWeekdayCalendarUnit;
    NSDateComponents *comps = [calendar components:unitFlags fromDate:self];
    NSInteger week = [comps weekday];
    NSString *weekStr = nil;
    switch (week) {
        case 1:
            weekStr = @"星期日";
            break;
        case 2:
            weekStr = @"星期一";
            break;
        case 3:
            weekStr = @"星期二";
            break;
        case 4:
            weekStr = @"星期三";
            break;
        case 5:
            weekStr = @"星期四";
            break;
        case 6:
            weekStr = @"星期五";
            break;
        default:
            weekStr = @"星期六";
            break;
    }
    return weekStr;
}

- (NSString *)gr_chineseMonth
{
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSMonthCalendarUnit;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    return m_str;
}

- (NSString *)gr_chineseDay
{
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    unsigned unitFlags = NSDayCalendarUnit;
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
    return d_str;
}

- (NSString *)gr_chineseDayOrMonth
{
    NSString *d_str = [self gr_chineseDay];
    if ([d_str isEqualToString:@"初一"]) {
        return [self gr_chineseMonth];
    } else {
        return d_str;
    }
}

- (NSString *)gr_chineseCalendar
{
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    
    
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSChineseCalendar];
    
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:self];
    
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
    
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@年%@%@",y_str,m_str,d_str];
    
    return chineseCal_str;
}

- (BOOL)gr_isDateBetweenBeginDate:(NSDate *)begin endDate:(NSDate *)end
{
    return [self compare:begin] != NSOrderedAscending && [self compare:end] != NSOrderedDescending;
}

- (NSInteger)gr_daysSince1970
{
    return [self timeIntervalSince1970] / (60 * 60 * 24);
}

- (NSInteger)gr_monthsSince1970
{
    NSInteger year = [self gr_year];
    NSInteger month = [self gr_month];
    return (year - 1970) * 12 + month - 1;
}

- (BOOL)gr_isYear:(NSInteger )year month:(NSInteger)month day:(NSInteger)day
{
    NSInteger currentYear = [self gr_year];
    if (currentYear != year) {
        return NO;
    }
    NSInteger currentMonth = [self gr_month];
    if (currentMonth != month) {
        return NO;
    }
    NSInteger currentDay = [self gr_day];
    if (currentDay != day) {
        return NO;
    }
    return YES;
}

- (NSInteger)gr_age
{
    NSDate *date = [NSDate date];
    
    NSInteger year = [self gr_year];
    NSInteger month = [self gr_month];
    NSInteger day = [self gr_day];
    
    NSInteger currYear = [date gr_year];
    NSInteger currMonth = [date gr_month];
    NSInteger currDay = [date gr_day];
    NSInteger age = 0;
    if (currYear > year) {
        age = currYear - year;
        if (currMonth < month) {
            age -= 1;
        } else if (currMonth == month) {
            if (currDay < day) {
                age -= 1;
            }
        }
    }
    return age;
}

- (BOOL)gr_isCurrentMonth
{
    NSDate *date = [NSDate date];
    
    NSInteger year = [self gr_year];
    NSInteger currYear = [date gr_year];
    if (year != currYear) {
        return NO;
    }
    
    NSInteger month = [self gr_month];
    NSInteger currMonth = [date gr_month];
    return month == currMonth;
}

#pragma mark - get NSDate format static

+ (NSString *)gr_formatTimeWithZeroDiffTime:(long long)zeroDiffTime
{
    zeroDiffTime = zeroDiffTime / 1000;
    zeroDiffTime = zeroDiffTime / 60;
    NSInteger minute = zeroDiffTime % 60;
    zeroDiffTime = zeroDiffTime / 60;
    NSInteger hour = zeroDiffTime % 60;
    return [NSString stringWithFormat:@"%ld:%ld",(long)hour,(long)minute];
}

+ (NSString *)gr_formatDateTimeForm:(long long)fromDateTime to:(long long)toDateTime
{
    NSDate *fromDate = [NSDate gr_dateFromSecond:fromDateTime];
    NSDate *toDate = [NSDate gr_dateFromSecond:toDateTime];
    
    NSString *fromDateStr = [fromDate gr_formatDateStr];
    NSString *toDateStr = [toDate gr_formatDateStr];
    if ([fromDateStr isEqualToString:toDateStr]) {
        NSString *fromTimeStr = [fromDate gr_formatTimeStrTypeC];
        NSString *toTimeStr = [toDate gr_formatTimeStrTypeC];
        return [NSString stringWithFormat:@"%@ %@ ~ %@",fromDateStr,fromTimeStr,toTimeStr];
    } else {
        NSString *fromDateTimeStr = [fromDate gr_formatDateTimeStr];
        NSString *toDateTimeStr = [toDate gr_formatDateTimeStr];
        return [NSString stringWithFormat:@"%@ ~ %@",fromDateTimeStr,toDateTimeStr];
    }
}

+ (NSString *)gr_willBeginTimeStringWithCurrentTime:(long long)currentTime beginTime:(long long)beginTime
{
    if (beginTime <= currentTime) {
        return @"即将开始";
    } else {
        const static long long oneMinute = 60;
        const static long long oneHour = oneMinute * 60;
        const static long long oneDay = oneHour * 24;
        
        long long diffSecond = beginTime - currentTime;
        
        long long day = diffSecond / oneDay;
        diffSecond = diffSecond % oneDay;
        
        long long hour = diffSecond / oneHour;
        diffSecond = diffSecond % oneHour;
        
        long long miniute = diffSecond / oneMinute;
        long long second = diffSecond % oneMinute;
        
        if (day > 999) {
            return [NSString stringWithFormat:@"999+天"];
        } else if (day) {
            return [NSString stringWithFormat:@"%lld天%.2lld:%.2lld:%.2lld",day,hour,miniute,second];
        } else {
            return [NSString stringWithFormat:@"%.2lld:%.2lld:%.2lld",hour,miniute,second];
        }
    }
}

+ (NSString *)gr_willEndTimeStringWithCurrentTime:(long long)currentTime endTime:(long long)endTime
{
    if (endTime <= currentTime) {
        return @"已结束";
    } else {
        const static long long oneMinute = 60;
        const static long long oneHour = oneMinute * 60;
        const static long long oneDay = oneHour * 24;
        
        long long diffSecond = endTime - currentTime;
        
        long long day = diffSecond / oneDay;
        diffSecond = diffSecond % oneDay;
        
        long long hour = diffSecond / oneHour;
        diffSecond = diffSecond % oneHour;
        
        long long miniute = diffSecond / oneMinute;
        long long second = diffSecond % oneMinute;
        
        if (day > 999) {
            return [NSString stringWithFormat:@"999+天"];
        } else if (day) {
            return [NSString stringWithFormat:@"%lld天%.2lld:%.2lld:%.2lld",day,hour,miniute,second];
        } else {
            return [NSString stringWithFormat:@"%.2lld:%.2lld:%.2lld",hour,miniute,second];
        }
    }
}

+ (NSString *)gr_diffDayFromTime:(long long)fromTime toTime:(long long)toTime
{
    if (fromTime >= toTime) {
        return nil;
    } else {
        const static long long oneMinute = 60;
        const static long long oneHour = oneMinute * 60;
        const static long long oneDay = oneHour * 24;
        
        long long diffSecond = toTime - fromTime;
        
        long long day = diffSecond / oneDay;
        
        if (day > 999) {
            return [NSString stringWithFormat:@"999+天"];
        } else if (day > 0) {
            return [NSString stringWithFormat:@"%lld天",day];
        } else {
            return [NSString stringWithFormat:@"不足一天"];
        }
    }
}

#pragma mark - get NSDate formater

- (NSString *)gr_formatTimeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setAMSymbol:@"上午"];
    [formatter setPMSymbol:@"下午"];
    [formatter setDateFormat:@"aaahh:mm"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatTimeStrTypeA
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setAMSymbol:@"上午"];
    [formatter setPMSymbol:@"下午"];
    [formatter setDateFormat:@"aaa hh:mm"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatTimeStrTypeB
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatTimeStrTypeC
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateTimeStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateTimeStrTypeA
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setAMSymbol:@"上午"];
    [formatter setPMSymbol:@"下午"];
    [formatter setDateFormat:@"MM月dd日aaahh:mm"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateTimeStrTypeB
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd HH:mm:ss"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateTimeStrTypeC
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd HH:mm"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateTimeStrTypeD
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateTimeStrTypeE
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatYearAndMontchStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatYearAndMontchStrTypeA
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateStr
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateStrTypeA
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日"];
    NSString *ret = [formatter stringFromDate:self];
    return ret;
}

- (NSString *)gr_formatDateStrTypeB {
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [[NSDateComponents alloc]init];
    comps = [calendar components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self];
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    NSInteger year = [comps year];
    NSString *ret = [NSString stringWithFormat:@"%@.%@.%@",@(year),@(month),@(day)];
    return ret;
}

- (NSString *)gr_autoFormatDateAndTimeStr
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *thisDateComponents = [greCalendar components:unitFlags fromDate:self];
    NSDateComponents *todayDateComponents = [greCalendar components:unitFlags fromDate:[NSDate date]];
    
    if (thisDateComponents.year == todayDateComponents.year
        && thisDateComponents.month == todayDateComponents.month
        && thisDateComponents.day == todayDateComponents.day) {
        return [self gr_formatTimeStrTypeB];
    } else if (thisDateComponents.year == todayDateComponents.year){
        return [self gr_formatDateTimeStrTypeB];
    } else {
        return [self gr_formatDateTimeStrTypeD];
    }
}

- (NSString *)gr_autoFormatDateAndTimeStrTypeA
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *thisDateComponents = [greCalendar components:unitFlags fromDate:self];
    NSDateComponents *todayDateComponents = [greCalendar components:unitFlags fromDate:[NSDate date]];
    
    if (thisDateComponents.year == todayDateComponents.year
        && thisDateComponents.month == todayDateComponents.month
        && thisDateComponents.day == todayDateComponents.day) {
        return [self gr_formatTimeStrTypeC];
    } else if (thisDateComponents.year == todayDateComponents.year){
        return [self gr_formatDateTimeStrTypeC];
    } else {
        return [self gr_formatDateTimeStrTypeE];
    }
}

- (NSString *)gr_autoFormatDateAndTimeStrTypeB
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *thisDateComponents = [greCalendar components:unitFlags fromDate:self];
    NSDateComponents *todayDateComponents = [greCalendar components:unitFlags fromDate:[NSDate date]];
    
    if (thisDateComponents.year == todayDateComponents.year
        && thisDateComponents.month == todayDateComponents.month
        && thisDateComponents.day == todayDateComponents.day) {
        return [self gr_formatTimeStrTypeB];
    } else if (thisDateComponents.year == todayDateComponents.year){
        return [self gr_formatDateTimeStrTypeC];
    } else {
        return [self gr_formatDateStr];
    }
}

- (NSString *)gr_autoFormatDateAndTimeStrTypeC
{
    NSCalendar *greCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents *thisDateComponents = [greCalendar components:unitFlags fromDate:self];
    NSDateComponents *todayDateComponents = [greCalendar components:unitFlags fromDate:[NSDate date]];
    
    if (thisDateComponents.year == todayDateComponents.year
        && thisDateComponents.month == todayDateComponents.month
        && thisDateComponents.day == todayDateComponents.day) {
        return [self gr_formatTimeStrTypeC];
    } else if (thisDateComponents.year == todayDateComponents.year){
        return [self gr_formatDateTimeStrTypeC];
    } else {
        return [self gr_formatDateStr];
    }
}

- (NSString *)gr_formatDateAndWeekString
{
    return [[self gr_formatDateStr] stringByAppendingString:[self gr_week]];
}

- (NSString *)gr_formatIntervalToDate:(NSDate *)toDate
{
    long long sourceSecond = [self gr_second];
    long long targetSecond = [toDate gr_second];
    
    long long diffSecond = targetSecond - sourceSecond;
    
    const static long long oneMinute = 60;
    const static long long oneHour = oneMinute * 60;
    const static long long oneDay = oneHour * 24;
    const static long long oneMonth = oneDay * 30;
    
    if (diffSecond < oneMinute) {
        return NSLocalizedString(@"刚刚", nil);
    } else if (diffSecond < oneHour) {
        return [NSString stringWithFormat:@"%lld分钟前",diffSecond / oneMinute];
    } else if (diffSecond < oneDay) {
        return [NSString stringWithFormat:@"%lld小时前",diffSecond / oneHour];
    } else if (diffSecond < oneMonth) {
        long long day = diffSecond / oneDay;
        if (day == 1 || day == 2) {
            NSString *dayString = @"昨天";
            if (day == 2) {
                dayString = @"前天";
            }
            NSString *meridiemString = nil;
            NSInteger hour = [self gr_hour];
            if (hour < 12) {
                meridiemString = @"早上";
            } else if (hour < 16) {
                meridiemString = @"下午";
            } else {
                meridiemString = @"晚上";
            }
            return [NSString stringWithFormat:@"%@-%@",dayString,meridiemString];
        }
    }
    return [self gr_formatDateStr];
}

- (NSString *)gr_formatInterval
{
    return [self gr_formatIntervalToDate:[NSDate date]];
}

@end
