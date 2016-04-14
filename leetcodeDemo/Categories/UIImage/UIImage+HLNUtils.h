//
//  UIImage+HLNUtils.h
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HLNUtils)

- (UIImage *)resizeImage;

+ (UIImage *)resizeImage:(NSString *)imageName;

+ (UIImage *)resizeImageWithImage:(NSString *)image Left:(CGFloat)left Top:(CGFloat)top;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)captureView:(UIView *)view;

- (UIImage *)drawImageSize:(CGSize)size inRect:(CGRect)rect bgColor:(UIColor *)color;

- (UIImage *)drawImageSize:(CGSize)size inRect:(CGRect)rect;

- (UIImage *)thumbnailImage;

@end
