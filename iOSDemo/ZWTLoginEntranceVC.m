//
//  ZWTLoginEntranceVC.m
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import "ZWTLoginEntranceVC.h"

@interface ZWTLoginEntranceVC ()

@end

@implementation ZWTLoginEntranceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor systemGray5Color];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor systemGray4Color];
    [btn setTitle:@"Login" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self.delegate action:@selector(loginSuccess:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

@end
