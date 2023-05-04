//
//  ZWTLoginEntranceVC.h
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ZWTLoginDelegate <NSObject>

- (void)loginSuccess:(UIButton *)sender;

@end

@interface ZWTLoginEntranceVC : UIViewController

@property (nonatomic, weak) id<ZWTLoginDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
