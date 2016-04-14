//
//  UIImage+HLNUtils.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/5.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "UIImage+HLNUtils.h"

#define kThumbnailImageDefaultWidth     (kScreenSize.width / 3)
#define kThumbnailImageDefaultHeight    150.f

@implementation UIImage (HLNUtils)

- (UIImage *)resizeImage
{
    return [self stretchableImageWithLeftCapWidth:(0.5f * self.size.width) topCapHeight:(0.5f * self.size.height)];
}

+ (UIImage *)resizeImageWithImage:(NSString *)image Left:(CGFloat)left Top:(CGFloat)top
{
    UIImage *img = [self imageNamed:image];
    
    return [img stretchableImageWithLeftCapWidth:(left * img.size.width) topCapHeight:(top * img.size.height)];
}

+ (UIImage *)resizeImage:(NSString *)imageName
{
    return [self resizeImageWithImage:imageName Left:0.5f Top:0.5f];
}

+ (UIImage *)imageWithColor:(UIColor *)color;
{
    if (![color isKindOfClass:[UIColor class]] || (color == nil)) return nil;
    
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *tempImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return tempImage;
}

+ (UIImage *)captureView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage *)drawImageSize:(CGSize)size inRect:(CGRect)rect bgColor:(UIColor *)color
{
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    UIImage *bgImage = [UIImage imageWithColor:color];
    if (bgImage != nil) [bgImage drawInRect:(CGRect){CGPointZero, size}];
    
    [self drawInRect:rect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)drawImageSize:(CGSize)size inRect:(CGRect)rect
{
    return [self drawImageSize:size inRect:rect bgColor:nil];
}

- (UIImage *)thumbnailImage
{
    CGSize originalSize = self.size;
    CGSize thumbnailSize = CGSizeZero;
    
    if (originalSize.width > originalSize.height) {
        if (originalSize.width > kScreenSize.width) {
            thumbnailSize.width = kThumbnailImageDefaultHeight;
        }else if (originalSize.width < kThumbnailImageDefaultWidth) {
            thumbnailSize = originalSize;
        }else {
            thumbnailSize.width = kThumbnailImageDefaultWidth;
        }
        thumbnailSize.height = originalSize.height * (thumbnailSize.width / originalSize.width);
    }else {
        if (originalSize.height > kScreenSize.height) {
            thumbnailSize.height = kThumbnailImageDefaultHeight;
        }else if (originalSize.height < kThumbnailImageDefaultWidth) {
            thumbnailSize = originalSize;
        } else {
            thumbnailSize.height = kThumbnailImageDefaultWidth;
        }
        thumbnailSize.width = originalSize.width * (thumbnailSize.height / originalSize.height);
    }
    
    return [self drawImageSize:thumbnailSize inRect:(CGRect){CGPointZero, thumbnailSize}];
}

@end
