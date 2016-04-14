//
//  HLNURLMacro.h
//  HLN-IMDemo
//
//  Created by heiline on 15/8/26.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#ifndef HLN_IMDemo_HLNURLMacro_h
#define HLN_IMDemo_HLNURLMacro_h

extern NSString *const kBaseURL;

/** 获取分组列表*/
#define kCustomerGroupListURL                                                             [NSString stringWithFormat:@"%@customer/group/list", kBaseURL]

/** 获取分组用户列表*/
#define kCustomerGroupCustomerListURL                                                                [NSString stringWithFormat:@"%@customer/group/customerlist", kBaseURL]

/** 关键词搜索联系人列表*/
#define kCustomerSearchURL                                                                           [NSString stringWithFormat:@"%@customer/search", kBaseURL]

/** 提供商户某个的客户基本详情（下单次数、评价次数、平均评价星级等）*/
#define kCustomerDetailURL                                                                           [NSString stringWithFormat:@"%@customer/detail", kBaseURL]

/** 检查商户能否同用户发起聊天*/
#define kCustomerCanChatURL                                                                           [NSString stringWithFormat:@"%@customer/chat/check", kBaseURL]

/** 修改备注名*/
#define kCustomerChangeRemarkNameURL @"http://zhida.baidu.com/HLN/mobile/zhidahao/v1/HLN/customer/interpose"

#endif
