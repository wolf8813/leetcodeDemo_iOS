//
//  HLNDate.m
//  testCalender
//
//  Created by heiline on 14/11/13.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import "HLNDate.h"

static NSCalendar           *_calendar;
static NSDateFormatter      *_fmt;

@implementation HLNDate

+ (NSInteger)date:(NSDate *)date unitFlags:(NSCalendarUnit)unitFlags
{
    @try {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _calendar = [NSCalendar currentCalendar];
        });
        
        NSDateComponents *compons = [_calendar components:(unitFlags) fromDate:date];
        switch (unitFlags) {
            case NSCalendarUnitYear:
                return [compons year];
                break;
            case NSCalendarUnitMonth:
                return [compons month];
                break;
            case NSCalendarUnitDay:
                return [compons day];
                break;
            case NSCalendarUnitHour:
                return [compons hour];
                break;
            case NSCalendarUnitMinute:
                return [compons minute];
                break;
            case NSCalendarUnitSecond:
                return [compons second];
                break;
            case NSCalendarUnitWeekday:
                return [compons weekday];
                break;
            default:
                return 0;
                break;
        }
    }
    @catch (NSException *exception) {
        [self date:date unitFlags:unitFlags];
    }
    @finally {
        
    }
}

+ (NSInteger)dateSecond:(NSDate *)date
{
    return [self date:date unitFlags:NSCalendarUnitSecond];
}

+ (NSInteger)secondFromTimeInterval:(long long)timeInterval
{
    return [self dateSecond:[NSDate dateWithTimeIntervalSince1970:timeInterval]];
}

+ (NSInteger)dateMinute:(NSDate *)date
{
    return [self date:date unitFlags:NSCalendarUnitMinute];
}

+ (NSInteger)dateHour:(NSDate *)date
{
    return [self date:date unitFlags:NSCalendarUnitHour];
}

+ (NSString *)dateHourMinute:(NSDate *)date
{
    return [NSString stringWithFormat:@"%d:%d", (int)[self dateHour:date], (int)[self dateMinute:date]];
}

+ (NSInteger)dateWeekday:(NSDate *)date
{
    return [self date:date unitFlags:NSCalendarUnitWeekday];
}

+ (NSString *)dateWeekdayStr:(NSDate *)date
{
    switch ([self dateWeekday:date]) {
        case 1:
            return @"星期天";
            break;
        case 2:
            return @"星期一";
            break;
        case 3:
            return @"星期二";
            break;
        case 4:
            return @"星期三";
            break;
        case 5:
            return @"星期四";
            break;
        case 6:
            return @"星期五";
            break;
        case 7:
            return @"星期六";
            break;
        default:
            return nil;
            break;
    }
}

+ (NSInteger)dateDay:(NSDate *)date
{
    return [self date:date unitFlags:NSCalendarUnitDay];
}

+ (NSInteger)dateMonth:(NSDate *)date
{
    return [self date:date unitFlags:NSCalendarUnitMonth];
}

+ (NSInteger)dateYear:(NSDate *)date
{
    return [self date:date unitFlags:NSCalendarUnitYear];
}

+ (BOOL)dateYear:(NSDate *)date equalToAnother:(NSDate *)another
{
    return ([self dateYear:date] == [self dateYear:another]);
}

+ (BOOL)dateMonth:(NSDate *)date equalToAnother:(NSDate *)another
{
    return ([self dateMonth:date] == [self dateMonth:another]);
}

+ (BOOL)dateDay:(NSDate *)date equalToAnother:(NSDate *)another
{
    return ([self dateDay:date] == [self dateDay:another]);
}

+ (BOOL)dateHour:(NSDate *)date equalToAnother:(NSDate *)another
{
    return ([self dateHour:date] == [self dateHour:another]);
}

+ (BOOL)dateMinute:(NSDate *)date equalToAnother:(NSDate *)another
{
    return ([self dateMinute:date] == [self dateMinute:another]);
}

+ (BOOL)dateExceptMinuteSecond:(NSDate *)date equalToAnother:(NSDate *)another
{
    if ([self dateYear:date equalToAnother:another] && [self dateMonth:date equalToAnother:another] && [self dateDay:date equalToAnother:another] && [self dateHour:date equalToAnother:another]) {
        return YES;
    }
    
    return NO;
}

+ (BOOL)dateExceptSecond:(NSDate *)date equalToAnother:(NSDate *)another
{
    if ([self dateYear:date equalToAnother:another] && [self dateMonth:date equalToAnother:another] && [self dateDay:date equalToAnother:another] && [self dateHour:date equalToAnother:another] && [self dateMinute:date equalToAnother:another]) {
        return YES;
    }
    
    return NO;
}

+ (NSInteger)dateDayDelta:(NSDate *)date dateAnother:(NSDate *)another
{
    return ([self dateDay:date] - [self dateDay:another]);
}

+ (BOOL)dateSecondInDelta:(NSInteger)delta date:(NSDate *)date dateAnother:(NSDate *)another
{
    if ([self dateExceptSecond:date equalToAnother:another]) {
        return YES;
    }
    
    if ([self dateYear:date equalToAnother:another] && [self dateMonth:date equalToAnother:another] && [self dateDay:date equalToAnother:another] && [self dateHour:date equalToAnother:another]) {

        if (ABS([self dateMinute:date] - [self dateMinute:another]) == 1) {
            if (((60 - [self dateSecond:date]) + [self dateSecond:another]) <= delta) {
                return YES;
            }
        }
    }
    
    return NO;
}

+ (NSString *)timeStrWithStaticFormate:(NSString *)formate timeInterval:(long long)timeInterval
{
    if (timeInterval <= 0) return nil;
    
    @try {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _fmt = [[NSDateFormatter alloc] init];
        });
        
        _fmt.dateFormat = formate;
        
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:(timeInterval)];
        if (date == nil) return nil;
        
        return [_fmt stringFromDate:date];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

+ (NSString *)timeStrWithFormate:(NSString *)formate timeInterval:(long long)timeInterval
{
    if (timeInterval <= 0) return nil;
    
    @try {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            _fmt = [[NSDateFormatter alloc] init];
        });
        
        _fmt.dateFormat = formate;
        
        NSDate *msgDate = [NSDate dateWithTimeIntervalSince1970:(timeInterval)];
        NSDate *nowDate = [NSDate date];
        
        if (msgDate == nil) return nil;
        
        if ([HLNDate dateYear:msgDate equalToAnother:nowDate]) {
            
            if ([HLNDate dateMonth:msgDate equalToAnother:nowDate]) {
                
                int dayDelta = (int)[HLNDate dateDayDelta:nowDate dateAnother:msgDate];
                
                if ([self dateSecondInDelta:60 date:msgDate dateAnother:nowDate]) {
                    return @"刚刚";
                }
                
                switch (dayDelta) {
                    case 0:{
                        return [NSString stringWithFormat:@"%02d:%02d", (int)[HLNDate dateHour:msgDate], (int)[HLNDate dateMinute:msgDate]];
                        break;
                    }
                    case 1:{
                        return [NSString stringWithFormat:@"昨天 %02d:%02d", (int)[HLNDate dateHour:msgDate], (int)[HLNDate dateMinute:msgDate]];
                        break;
                    }
                    case 2:{
                        return [NSString stringWithFormat:@"前天 %02d:%02d", (int)[HLNDate dateHour:msgDate], (int)[HLNDate dateMinute:msgDate]];
                        break;
                    }
                    default:{
                        
                        if ((dayDelta == 3) || (dayDelta == 4) || (dayDelta == 5) || (dayDelta == 6)) {
                            return [NSString stringWithFormat:@"%@ %02d:%02d", [HLNDate dateWeekdayStr:msgDate], (int)[HLNDate dateHour:msgDate], (int)[HLNDate dateMinute:msgDate]];
                        }
                        
                        return [NSString stringWithFormat:@"%d-%d %02d:%02d", (int)[HLNDate dateMonth:msgDate], (int)[HLNDate dateDay:msgDate], (int)[HLNDate dateHour:msgDate], (int)[HLNDate dateMinute:msgDate]];
                    }
                }
            }
        }
        
        return [_fmt stringFromDate:msgDate];
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

+ (NSString *)messageTimeStrFromTimeInterval:(long long)timeInterval
{
    return [self timeStrWithFormate:@"yyyy年MM月dd日 HH:mm" timeInterval:timeInterval];
}

+ (NSString *)sessionTimeStrFromTimeInterval:(long long)timeInterval
{
    return [self timeStrWithFormate:@"yy/MM/dd" timeInterval:timeInterval];
}

+ (long long)timeIntervalWithFormate:(NSString *)formate time:(NSString *)time
{
    
    if (_fmt == nil) {
        _fmt = [[NSDateFormatter alloc] init];
    }
    
    _fmt.dateFormat = formate;
    NSDate *date = [_fmt dateFromString:time];
    return [date timeIntervalSince1970];
}

@end
