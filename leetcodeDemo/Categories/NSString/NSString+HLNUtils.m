//
//  NSString+HLNUtils.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "NSString+HLNUtils.h"

@implementation NSString (HLNUtils)

- (NSString *)appendDocumentDir
{
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:self];
}

- (NSURL *)appendDocumentURL
{
    return [NSURL fileURLWithPath:[self appendDocumentDir]];
}

- (void)logStringFromUTF8
{
    UIWebView *web = [[UIWebView alloc] init];
    NSString *js = [NSString stringWithFormat:@"decodeURIComponent('%@')",self];
    NSString *str = [web stringByEvaluatingJavaScriptFromString:js];
    KSLog(@"%@",str);
}

-(BOOL)isValidMobile
{
    //手机号以13，15，17，18开头，八个 \d 数字字符
    NSString *phoneRegex = @"^((13[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9])|(17[0,0-9])|(14[0,0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    //    NSLog(@"phoneTest is %@",phoneTest);
    return [phoneTest evaluateWithObject:self];
}

- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

+ (NSString *)timeNow
{
    NSDate *senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *locationString = [dateformatter stringFromDate:senddate];
    
    return locationString;
}

+ (NSString *)timeNowFileName
{
    static int seedNum = 0;
    if(seedNum >= 1000)
        seedNum = 0;
    seedNum++;
    
    NSDate *senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss"];
    NSString *locationString = [dateformatter stringFromDate:senddate];
    return [NSString stringWithFormat:@"tmp%@%03d", locationString, seedNum];
}

+ (NSString *)timeNowWithFmt:(NSString *)fmt
{
    NSDate *senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:fmt];
    NSString *locationString = [dateformatter stringFromDate:senddate];
    return locationString;
}

- (BOOL)passwordIsValid
{
    
    //    /^[\@A-Za-z0-9\!\#\$\%\^\&\*\.\~]{6,22}$/
    NSString *phoneRegex = @"^[\\@A-Za-z0-9\\!\\#\\$\\%\\^\\&\\*\\.\\~]{6,22}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:self];
}

- (BOOL)containEmoji
{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        const unichar hs = [substring characterAtIndex:0];
        
        if (0xd800 <= hs && hs <= 0xdbff) {
            if (substring.length > 1) {
                const unichar ls = [substring characterAtIndex:1];
                const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                if (0x1d000 <= uc && uc <= 0x1f77f) {
                    returnValue = YES;
                }
            }
        } else if (substring.length > 1) {
            const unichar ls = [substring characterAtIndex:1];
            if (ls == 0x20e3 || ls == 0xfe0f) {
                returnValue = YES;
            }
        } else {
            // non surrogate
            if (0x2100 <= hs && hs <= 0x27ff) {
                returnValue = YES;
            } else if (0x2B05 <= hs && hs <= 0x2b07) {
                returnValue = YES;
            } else if (0x2934 <= hs && hs <= 0x2935) {
                returnValue = YES;
            } else if (0x3297 <= hs && hs <= 0x3299) {
                returnValue = YES;
            } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                returnValue = YES;
            }
        }
        
    }];
    
    return returnValue;
}

- (CGFloat)textHeightWithSize:(CGSize)size textFont:(UIFont *)textFont
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: textFont} context:nil].size.height;
}

- (CGFloat)textHeightWithWidth:(CGFloat)width textFont:(UIFont *)textFont
{
    return [self textHeightWithSize:CGSizeMake(width, MAXFLOAT) textFont:textFont];
}

- (CGFloat)textWidthFont:(UIFont *)textFont
{
    return [self sizeWithAttributes:@{NSFontAttributeName: textFont}].width;
}

- (BOOL)containNewLine
{
    if (!HLN_VALID_OBJC(self)) return NO;
    return ([self rangeOfString:@"\n"].length || [self rangeOfString:@"\r"].length);
}

- (NSString *)replaceNewLine
{
    NSString *str = self;
    str = [str stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    str = [str stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return str;
}

- (NSString *)replaceAllWhitespaceAndNewLine
{
    NSString *str = self;
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    str = [str replaceNewLine];
    return str;
}

// 匹配中英数和下划线,空格
- (BOOL)checkStringOnlyChineseEnglishNum
{
    NSString *regex = @"^[a-zA-Z0-9_\u4e00-\u9fa5\\s]+$";
    
    NSPredicate *test = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [test evaluateWithObject:self];
}

//匹配网址
- (NSArray *)httpURLMatches
{
    NSString *regulaStr = @"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\d+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)";
    
    return [self matchesArray:regulaStr];
}

//匹配电话号码
- (NSArray *)phoneNumMatches
{
    NSString *regulaStr = @"\\d{3}-\\d{8}|\\d{3}-\\d{7}|\\d{4}-\\d{8}|\\d{4}-\\d{7}|1+[358]+\\d{9}|\\d{8}|\\d{7}";
    
    return [self matchesArray:regulaStr];
}

- (NSArray *)matchesArray:(NSString *)regularStr
{
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regularStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:self options:0 range:NSMakeRange(0, [self length])];
    
    return arrayOfAllMatches;
}

- (BOOL)remarkNameIsValid
{
    NSString *regulaStr = @".*[\\,\\!\\@\\#\\$\\%\\^\\&\\*\\(\\)\\-\\+\\=\\_\\[\\]\\{\\}\\;\\:\\'\\\"\\?\\.\\<\\>！￥（）－＋｛｝【】‘“，’”？：；。`·《》].*";
    NSPredicate *remartNameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regulaStr];
    return ![remartNameTest evaluateWithObject:self];
}

- (void)makePhoneCall
{
    if (!HLN_VALID_OBJC(self)) return;
    
    NSURL *phoneURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",self]];
    static UIWebView *phoneCallWebView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        phoneCallWebView = [[UIWebView alloc] initWithFrame:CGRectZero];
    });
    
    [phoneCallWebView loadRequest:[NSURLRequest requestWithURL:phoneURL]];
}

@end
