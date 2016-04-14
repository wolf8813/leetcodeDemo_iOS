//
//  KSDate.h
//  testCalender
//
//  Created by heiline on 14/11/13.
//  Copyright (c) 2014年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HLNDate : NSObject

+ (NSInteger)dateDayDelta:(NSDate *)date dateAnother:(NSDate *)another;
+ (BOOL)dateSecondInDelta:(NSInteger)delta date:(NSDate *)date dateAnother:(NSDate *)another;

+ (BOOL)dateYear:(NSDate *)date equalToAnother:(NSDate *)another;
+ (BOOL)dateMonth:(NSDate *)date equalToAnother:(NSDate *)another;
+ (BOOL)dateDay:(NSDate *)date equalToAnother:(NSDate *)another;
+ (BOOL)dateHour:(NSDate *)date equalToAnother:(NSDate *)another;
+ (BOOL)dateMinute:(NSDate *)date equalToAnother:(NSDate *)another;
+ (BOOL)dateExceptMinuteSecond:(NSDate *)date equalToAnother:(NSDate *)another;
+ (BOOL)dateExceptSecond:(NSDate *)date equalToAnother:(NSDate *)another;

+ (NSInteger)dateSecond:(NSDate *)date;
+ (NSInteger)secondFromTimeInterval:(long long)timeInterval;
+ (NSInteger)dateMinute:(NSDate *)date;
+ (NSInteger)dateHour:(NSDate *)date;
+ (NSString *)dateHourMinute:(NSDate *)date;

+ (NSInteger)dateWeekday:(NSDate *)date;
+ (NSString *)dateWeekdayStr:(NSDate *)date;

+ (NSInteger)dateDay:(NSDate *)date;
+ (NSInteger)dateMonth:(NSDate *)date;

+ (NSInteger)dateYear:(NSDate *)date;

+ (NSString *)timeStrWithStaticFormate:(NSString *)formate timeInterval:(long long)timeInterval;

+ (NSString *)timeStrWithFormate:(NSString *)formate timeInterval:(long long)timeInterval;

+ (long long)timeIntervalWithFormate:(NSString *)formate time:(NSString *)time;

//+ (NSString *)messageTimeStrFromTimeInterval:(long long)timeInterval;
//
//+ (NSString *)sessionTimeStrFromTimeInterval:(long long)timeInterval;

@end
