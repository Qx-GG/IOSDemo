//
//  ZWTUnLoginVC.m
//  iOS_Demo_Objective-C_Swift
//
//  Created by Clutch Powers on 2023/4/28.
//

#import "ZWTUnLoginVC.h"
#import "ZWTLoginEntranceVC.h"
#import "ZWTLoginModel.h"
#import "ZWTVC.h"

@interface ZWTUnLoginVC () <ZWTLoginDelegate>

@property (nonatomic, strong) ZWTVC *zwtvc;

@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation ZWTUnLoginVC

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
    
    if ([ZWTLoginModel isLogin]) {
        [self.navigationController pushViewController:self.zwtvc animated:NO];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginButton];
    
}


- (void)login {
    ZWTLoginEntranceVC *loginEntranceVC = [[ZWTLoginEntranceVC alloc] init];
    
    if ([self conformsToProtocol:@protocol(ZWTLoginDelegate)]) {
        loginEntranceVC.delegate = self;
    } else {
        NSLog(@"ERROR: is not conformsToProtocol");
        return;
    }
    
    [self.navigationController presentViewController:loginEntranceVC animated:YES completion:nil];
}

- (void)loginSuccess:(UIButton *)sender {
    [ZWTLoginModel LoginWithUser:@"zwt" AndPassword:@"123456"];
    
    UIViewController *viewController = nil;
    UIResponder *responder = sender.nextResponder;
    while (responder && ![responder isKindOfClass:[UIViewController class]]) {
        responder = responder.nextResponder;
    }
    if ([responder isKindOfClass:[UIViewController class]]) {
        viewController = (UIViewController *)responder;
    }
    [viewController dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController pushViewController:self.zwtvc animated:NO];
        
}

#pragma mark - getter

- (ZWTVC *)zwtvc {
    if (!_zwtvc) {
        ZWTVC *zwtvc = [[ZWTVC alloc] init];
        _zwtvc = zwtvc;
    }
    return _zwtvc;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        btn.backgroundColor = [UIColor systemGray6Color];
        [btn setTitle:@"Login" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        _loginButton = btn;
    }
    return _loginButton;
}

@end
