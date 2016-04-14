//
//  NSError+Utils.h
//  CloudaHLN
//
//  Created by heiline on 15/9/8.
//  Copyright (c) 2015年 chenshuijin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (Utils)

+ (BOOL)isRequestFailure:(id)response;
+ (NSError *)errorResponse:(id)response;
+ (NSError *)errorCode:(NSInteger)code;

@end
