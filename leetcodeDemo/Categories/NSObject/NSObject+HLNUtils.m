//
//  NSObject+HLNUtils.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "NSObject+HLNUtils.h"
#import <objc/runtime.h>

@implementation NSObject (HLNUtils)

- (BOOL)isValid
{
    if ([self isKindOfClass:[NSNull class]]) return NO;
    if ([self isKindOfClass:[NSArray class]]) return [(NSArray *)self count];
    if ([self isKindOfClass:[NSSet class]]) return [(NSSet *)self count];
    if ([self isKindOfClass:[NSDictionary class]]) return [(NSDictionary *)self count];
    if ([self isKindOfClass:[NSString class]]) {
        if ([(NSString *)self isEqualToString:@"(null)"]) return NO;
        else return [(NSString *)self length];
    }
    
    return YES;
}

- (NSString *)setupFilePath:(NSString *)fileName
{
    NSString *filePath = [documentArchiveCache appendDocumentDir];
    
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:NULL];
    }
    
    return [filePath stringByAppendingPathComponent:fileName];
}

- (BOOL)archiveToFileName:(NSString *)fileName
{
    return [self archiveToFilePath:[self setupFilePath:fileName]];
}

- (id)unArchiveFromFileName
{
    return [[self setupFilePath:(NSString *)self] unArchiveFromFilePath];
}

- (BOOL)archiveToFilePath:(NSString *)filePath
{
    return [NSKeyedArchiver archiveRootObject:self toFile:filePath];
}

- (id)unArchiveFromFilePath
{
    return [NSKeyedUnarchiver unarchiveObjectWithFile:(NSString *)self];
}

- (NSString *)objectEncode
{
    KSAssert(!HLN_VALID_OBJC(self), @"ERROR: Object Is Invalid.");
    
    NSError *parseError = nil;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject:self options:0 error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (NSDictionary *)jsonToDict
{
    KSAssert(!HLN_VALID_OBJC(self), @"ERROR: Json String Is Invalid.");
    
    return [NSJSONSerialization JSONObjectWithData:[(NSString *)self dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
}

- (void)addProperty:(NSString *)property value:(id)value
{
    objc_setAssociatedObject(self, NSSelectorFromString(property), value, OBJC_ASSOCIATION_RETAIN);
}

- (id)getValueProperty:(NSString *)property
{
    return objc_getAssociatedObject(self, NSSelectorFromString(property));
}

- (void)removeProperty:(NSString *)property
{
    objc_setAssociatedObject(self, NSSelectorFromString(property), nil, OBJC_ASSOCIATION_RETAIN);
}

- (void)removeAllProperty
{
    objc_removeAssociatedObjects(self);
}

@end
