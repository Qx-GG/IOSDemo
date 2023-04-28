//
//  ZWTCheckLogin.h
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/// 登录业务, 基于 NSUserDefaults
@interface ZWTLoginModel : NSObject

+ (BOOL)isLogin;

+ (BOOL)LoginWithUser:(NSString *)usr AndPassword:(NSString *)psw;

+ (BOOL)Logout;

@end

NS_ASSUME_NONNULL_END
