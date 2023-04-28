//
//  ZWTImageTool.m
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import "ZWTImageTool.h"

@implementation ZWTImageTool

+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image {
    
    //- 1.开启一个和原始图片一样大小的位图上下文.
    CGSize size = CGSizeMake(image.size.width + 2 *borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size,NO,0);
    //-  2.绘制一个大圆,填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    //-  3.添加一个裁剪区域.
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    //-  4.把图片绘制到裁剪区域当中.
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    //-  5.生成一张新图片.
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    //-  6.关闭上下文.
    UIGraphicsEndImageContext();
    
    return clipImage;
}

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return reSizeImage;
}

@end
