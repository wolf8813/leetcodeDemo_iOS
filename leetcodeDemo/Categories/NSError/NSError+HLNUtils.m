//
//  NSError+Utils.m
//  CloudaHLN
//
//  Created by heiline on 15/9/8.
//  Copyright (c) 2015年 chenshuijin. All rights reserved.
//

#import "NSError+HLNUtils.h"
#import "HLNNetworkDefine.h"

static NSString *const kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_CODE_KEY = @"error_code";
static NSString *const kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_DESC_KEY = @"error_msg";

static NSString *const kHLNErrorDomain = @"com.baidu.HLN-ios";

static NSString *const kHLN_REQUEST_ERROR_DESC_NONE = @"无描述";
static NSString *const kHLN_REQUEST_ERROR_DESC_PARAM_INVALID = @"APP_ID为空";
static NSString *const kHLN_REQUEST_ERROR_DESC_SERVER_RESPONSE_INVALID = @"请求返回JSON不合法";
static NSString *const kHLN_REQUEST_ERROR_DESC_BDUSS_INVALID = @"Invalid user bduss";
static NSString *const kHLN_ReQUEST_ERROR_DESC_USER_DETAIL_NOT_FOUND = @"customer detail not found";

@implementation NSError (Utils)

+ (BOOL)isRequestFailure:(id)response
{
    NSDictionary *dict = (NSDictionary *)response;
    NSArray *allKeys = [dict allKeys];
    
    if ([allKeys containsObject:kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_CODE_KEY] ){
        id errorCode = dict[kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_CODE_KEY];
        if ([errorCode isKindOfClass:NSNumber.class]) {
            NSNumber *errorCodeNum = errorCode;
            if (errorCodeNum == 0) {
                return NO;
            }
        }
        else if ([errorCode isKindOfClass:NSString.class]) {
            NSString *errorCodeStr = errorCode;
            if ([errorCodeStr isEqualToString: @"0"]) {
                return NO;
            }
        }
        else{
            return YES;
        }
    }
    
    else if ([allKeys containsObject:kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_DESC_KEY]){
        id errorCode = dict[kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_DESC_KEY];
        if ([errorCode isKindOfClass:NSString.class]) {
            NSString *errorCodeStr = errorCode;
            if ([errorCodeStr isEqualToString: @"0"]) {
                return NO;
            }
        }
        else{
            return YES;
        }
    }
    return NO;
}

+ (NSString *)errorCodeDesc:(NSInteger)code
{
    NSString *desc = kHLN_REQUEST_ERROR_DESC_NONE;
    switch (code) {
        case HLN_REQUEST_ERROR_PARAM_INVALID: {
            desc = kHLN_REQUEST_ERROR_DESC_PARAM_INVALID;
            break;
        }
        case HLN_REQUEST_ERROR_SERVER_RESPONSE_INVALID: {
            desc = kHLN_REQUEST_ERROR_DESC_SERVER_RESPONSE_INVALID;
            break;
        }
        case HLN_REQUEST_ERROR_USER_DETAIL_NOT_FOUND: {
            desc = kHLN_ReQUEST_ERROR_DESC_USER_DETAIL_NOT_FOUND;
            break;
        }
        case HLN_REQUEST_ERROR_BDUSS_INVALID: {
            desc = kHLN_REQUEST_ERROR_DESC_BDUSS_INVALID;
            break;
        }
        default:
            break;
    }
    
    return desc;
}

+ (NSError *)errorResponse:(id)response
{
    NSDictionary *dict = (NSDictionary *)response;
    NSNumber *code = dict[kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_CODE_KEY];
    NSString *desc = dict[kHLN_REQUEST_ERROR_SERVER_RESPONSE_ERROR_DESC_KEY];
    
    NSDictionary *descDict = nil;
    if (desc != nil) descDict = @{NSLocalizedDescriptionKey: desc};
    
    return [[NSError alloc] initWithDomain:kHLNErrorDomain code:[code integerValue] userInfo:descDict];
}

+ (NSError *)errorCode:(NSInteger)code
{
    return [[NSError alloc] initWithDomain:kHLNErrorDomain code:HLN_REQUEST_ERROR_PARAM_INVALID userInfo:@{NSLocalizedDescriptionKey: [self errorCodeDesc:code]}];
}

@end
