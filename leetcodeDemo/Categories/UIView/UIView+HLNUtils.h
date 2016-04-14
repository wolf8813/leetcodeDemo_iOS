//
//  UIView+HLNUtils.h
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (HLNUtils)

@property (nonatomic, assign) CGFloat top;
@property (nonatomic, assign) CGFloat bottom;
@property (nonatomic, assign) CGFloat left;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

+ (UIView *)lightGrayLine;
+ (UIView *)lightGrayLineColor:(UIColor *)color;

- (id)superVC;

@end
