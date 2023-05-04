//
//  ZWTVC.m
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import "ZWTVC.h"
#import "ZWTLoginModel.h"
#import "ZWTUnLoginVC.h"

@interface ZWTVC ()

@end

@implementation ZWTVC

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    [super viewDidLoad];
    
    UIButton *logoutBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    logoutBtn.backgroundColor = [UIColor systemGray6Color];
    [logoutBtn setTitle:@"Logout" forState:UIControlStateNormal];
    [logoutBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [logoutBtn addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:logoutBtn];
}

- (void)logout {
    [ZWTLoginModel Logout];
    
    [self.navigationController popViewControllerAnimated:NO];
}


@end
