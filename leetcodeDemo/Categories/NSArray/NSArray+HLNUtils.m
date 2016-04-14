//
//  NSArray+HLNUtils.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/19.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "NSArray+HLNUtils.h"

@implementation NSArray (HLNUtils)

- (id)sumKeyPath:(NSString *)keyPath
{
    return [self valueForKeyPath:[NSString stringWithFormat:@"%@.@sum.floatValue", keyPath]];
}

@end
