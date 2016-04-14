//
//  NSObject+HLNUtils.h
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (HLNUtils)

/**
 *  判断对象是否合法
 *
 *  @return <#return value description#>
 */
- (BOOL)isValid;

/**
 *  归档至Document文件夹
 *
 *  @param fileName 文件名
 *
 *  @return 归档是否成功
 */
- (BOOL)archiveToFileName:(NSString *)fileName;

/**
 *  从Document文件夹解档文件
 *
 *  @return 对象
 */
- (id)unArchiveFromFileName;

/**
 *  归档至路径
 *
 *  @param filePath 路径
 *
 *  @return 归档成功与否
 */
- (BOOL)archiveToFilePath:(NSString *)filePath;

/**
 *  从指定路径解档
 *
 *  @return 对象
 */
- (id)unArchiveFromFilePath;

/**
 *  对象序列化
 *
 *  @return <#return value description#>
 */
- (NSString *)objectEncode;

/**
 *  对象反序列化
 *
 *  @return <#return value description#>
 */
- (NSDictionary *)jsonToDict;

/**
 *  为对象添加属性
 *
 *  @param property 属性名
 *  @param value    属性值
 */
- (void)addProperty:(NSString *)property value:(id)value;

/**
 *  获取添加属性的值
 *
 *  @param property 属性名
 *
 *  @return <#return value description#>
 */
- (id)getValueProperty:(NSString *)property;

/**
 *  移除属性
 *
 *  @param property 属性名
 */
- (void)removeProperty:(NSString *)property;
- (void)removeAllProperty;

@end
