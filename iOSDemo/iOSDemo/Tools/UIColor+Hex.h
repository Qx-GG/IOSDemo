//
//  UIColor+Hex.h
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:A]
#define RGB_COLOR(R, G, B) [UIColor colorWithRed:((R) / 255.0f) green:((G) / 255.0f) blue:((B) / 255.0f) alpha:1.0f]
 

//从十六进制字符串获取颜色，
//支持 @“#123456”、 @“0X123456”、 @“123456”三种格式
@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;
 
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

NS_ASSUME_NONNULL_END
