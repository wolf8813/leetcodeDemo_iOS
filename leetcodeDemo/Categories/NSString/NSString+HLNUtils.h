//
//  NSString+HLNUtils.h
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HLNUtils)

- (NSString *)appendDocumentDir;

- (NSURL *)appendDocumentURL;

- (void)logStringFromUTF8;

-(BOOL)isValidMobile;

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

+ (NSString *)timeNow;

+ (NSString *)timeNowFileName;

+ (NSString *)timeNowWithFmt:(NSString *)fmt;

- (BOOL)passwordIsValid;

- (BOOL)containEmoji;

- (CGFloat)textHeightWithWidth:(CGFloat)width textFont:(UIFont *)textFont;

- (CGFloat)textHeightWithSize:(CGSize)size textFont:(UIFont *)textFont;

- (CGFloat)textWidthFont:(UIFont *)textFont;

- (BOOL)containNewLine;

- (NSString *)replaceNewLine;
//替换所有空格和回车
- (NSString *)replaceAllWhitespaceAndNewLine;

// 匹配中英数和下划线
- (BOOL)checkStringOnlyChineseEnglishNum;

- (NSArray *)matchesArray:(NSString *)regularStr;

- (NSArray *)httpURLMatches;

- (NSArray *)phoneNumMatches;

- (BOOL)remarkNameIsValid;

- (void)makePhoneCall;

@end
