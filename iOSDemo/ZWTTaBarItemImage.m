//
//  ZWTTaBarItemImage.m
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import "ZWTTaBarItemImage.h"
#import "ZWTImageTool.h"
#import "UIColor+Hex.h"

@implementation ZWTTaBarItemImage

- (void)setImageName:(NSString *)name ForState:(ZWTImageState)state {
    UIColor *borderColor;
    UIImage *image = [UIImage imageNamed:name];
    
    if (state == ZWTImageStateNormal) {
        borderColor = [UIColor colorWithHexString:@"B4B7B9"];
    } else {
        borderColor = [UIColor colorWithHexString:@"007aff"];
    }
    
    image = [ZWTImageTool reSizeImage:image toSize:CGSizeMake(25, 25)];
    image = [ZWTImageTool imageWithBorderW:2.0f borderColor:borderColor image:image];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    if (state == ZWTImageStateNormal) {
        _normalImage = image;
    } else {
        _selectedImage = image;
    }
}

- (void)setImageName:(NSString *)name {
    [self setImageName:name ForState:ZWTImageStateNormal];
    [self setImageName:name ForState:ZWTImageStateSelected];
}

@end
