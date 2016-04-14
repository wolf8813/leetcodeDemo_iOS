//
//  UIView+HLNUtils.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "UIView+HLNUtils.h"

@implementation UIView (HLNUtils)

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top
{
    CGRect rect = self.frame;
    rect.origin.y = top;
    self.frame = rect;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect rect = self.frame;
    rect.origin.y = bottom - rect.size.height;
    self.frame = rect;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left
{
    CGRect rect = self.frame;
    rect.origin.x = left;
    self.frame = rect;
}

- (CGFloat)right
{
    return CGRectGetMaxX(self.frame);
}

- (void)setRight:(CGFloat)right
{
    KSAssert(self.frame.size.width, @"ERROR：Please Set Width First!");
    
    CGRect rect = self.frame;
    rect.origin.x = right - rect.size.width;
    self.frame = rect;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX
{
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY
{
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY
{
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect rect = self.frame;
    rect.origin = origin;
    self.frame = rect;
}

- (CGSize)size
{
    return self.frame.size;
}

- (void)setSize:(CGSize)size
{
    CGRect rect = self.frame;
    rect.size = size;
    self.frame = rect;
}

+ (UIView *)lightGrayLine
{
    return [self lightGrayLineColor:kLightGrayLineColor];
}

+ (UIView *)lightGrayLineColor:(UIColor *)color
{
    UIImageView *line = [[UIImageView alloc] init];
    line.frame = (CGRect){CGPointZero, CGSizeMake(kScreenSize.width, kLightGrayLineH)};
    line.image = [UIImage imageWithColor:color];
    
    return line;
}

- (id)superVC
{
    id superVC = self;
    while (![superVC isKindOfClass:[UIViewController class]]) {
        superVC = [superVC superview];
        
        if (!superVC) break;
        if ([[superVC nextResponder] isKindOfClass:[UIViewController class]]) {
            superVC = [superVC nextResponder];
        }
    }
    
    return [superVC isKindOfClass:[UIViewController class]] ? superVC : nil;
}

@end
