//
//  HLNFoundationMarcro.h
//  test
//
//  Created by heiline on 15/7/29.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#ifndef test_HLNFoundationMarcro_h
#define test_HLNFoundationMarcro_h

#ifdef DEBUG

#define KSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);

#define KSAssert(condition, desc) NSAssert(condition, desc);

#define KSLogViewHierarchy(view) KSLog(@"View Hierarchy:\n\n%@\n\n", [view performSelector:@selector(recursiveDescription)]);

#define BIMShowLog          NO

#else

#define KSLog(...)
#define KSAssert(condition, desc)
#define KSLogViewHierarchy(view)

#define BIMShowLog          NO

#endif

// IM相关配置
#define BIMAPPKEY           @"G0mLeW4OOhny1kWL23xhtx2v"
#define BIMAPPId            @"6376141"

// device verson float value
#define CURRENT_SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define HLN_VALID_OBJC(objc) (((objc != nil) && [objc isValid]) ? YES : NO)

#define HLN_MAIN_QUEUE dispatch_get_main_queue()
#define HLN_GLOBAL_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

#define dispatch_HLN_after(delay, block)\
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay * NSEC_PER_SEC)), dispatch_get_main_queue(), block);

#define kSemaphoreCreate            dispatch_semaphore_create(1);
#define kSemaphoreWait(smp)         dispatch_semaphore_wait(smp, DISPATCH_TIME_FOREVER);
#define kSemaphoreSignal(smp)       dispatch_semaphore_signal(smp);

#endif
