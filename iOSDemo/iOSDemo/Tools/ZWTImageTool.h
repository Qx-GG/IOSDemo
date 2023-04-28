//
//  ZWTImageTool.h
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN



@interface ZWTImageTool : NSObject

// 绘制圆角，添加边框
+ (UIImage *)imageWithBorderW:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;

// 裁剪图片
+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;

@end

NS_ASSUME_NONNULL_END
