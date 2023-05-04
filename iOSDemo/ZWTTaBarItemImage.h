//
//  ZWTTaBarItemImage.h
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ZWTImageState) {
    ZWTImageStateNormal        = 0,
    ZWTImageStateSelected      = 1,
};


@interface ZWTTaBarItemImage : NSObject

@property (nonatomic, strong, readonly) UIImage *normalImage;

@property (nonatomic, strong, readonly) UIImage *selectedImage;


// 提供两个接口,根据图片名来设置图片
// 不同的状态不同图片
- (void)setImageName:(NSString *)name ForState:(ZWTImageState)state;

// 不同状态相同图片
- (void)setImageName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
