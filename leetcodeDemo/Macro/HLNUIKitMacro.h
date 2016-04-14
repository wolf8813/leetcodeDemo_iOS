//
//  HLNUIKitMaro.h
//  test
//
//  Created by heiline on 15/7/29.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#ifndef test_HLNUIKitMaro_h
#define test_HLNUIKitMaro_h

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kScreenSize                         [UIScreen mainScreen].bounds.size
#define kFont(size)                         [UIFont systemFontOfSize:size]
#define kBoldFont(size)                     [UIFont boldSystemFontOfSize:size]

#define KSLogFrame(frame)                   KSLog(@"%@", NSStringFromCGRect(frame));
#define KSLogPoint(point)                   KSLog(@"%@", NSStringFromCGPoint(point));
#define KSLogSize(size)                     KSLog(@"%@", NSStringFromCGSize(size));

#define kColorRGB(R, G, B)                  [UIColor colorWithRed:(R / 255.f) green:(G / 255.f) blue:(B / 255.f) alpha:1.f]

#define kLightGrayLineH                     0.5f
#define kLightGrayLineColor                 kColorRGB(238, 238, 238)
#define kIMDefaultBgColor                   kColorRGB(248, 248, 248)

#define kUserDefault                        [NSUserDefaults standardUserDefaults]
#define kDefaultImage                       [UIImage imageNamed:@"Consultation_User_Avatar"]


extern const CGFloat kStatusBarH;
extern const CGFloat kNavBarH;
extern const CGFloat kTabBarH;

// Archive
// Archive文件夹
extern NSString *const documentArchiveCache;

#endif
