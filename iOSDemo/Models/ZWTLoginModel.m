//
//  ZWTCheckLogin.m
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import "ZWTLoginModel.h"

@implementation ZWTLoginModel

+ (BOOL)isLogin {
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@"LoginStatus"] isEqualToString:@"YES"]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)LoginWithUser:(NSString *)usr AndPassword:(NSString *)psw {
    if ([usr isEqualToString:@"zwt"] && [psw isEqualToString:@"123456"]) {
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"LoginStatus"];
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)Logout {
    [[NSUserDefaults standardUserDefaults] setObject:@"NO" forKey:@"LoginStatus"];
    return YES;
}

@end
