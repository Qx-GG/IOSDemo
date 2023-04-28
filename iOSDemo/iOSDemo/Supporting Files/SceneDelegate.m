//
//  SceneDelegate.m
//  iOSDemo
//
//  Created by Clutch Powers on 2023/4/28.
//

#import "SceneDelegate.h"
#import "iOSDemo-Swift.h"
#import "ZWTImageTool.h"
#import "ZWTLoginModel.h"
#import "UIColor+Hex.h"
#import "ZWTUnLoginVC.h"
#import "ZWTTaBarItemImage.h"
#import "ZWTVC.h"


@interface SceneDelegate ()<UITabBarControllerDelegate>

@property (nonatomic, assign) BOOL selected;

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    _selected = NO;
    
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.delegate = self;
    
    // iOS 15 新特性 scrollEdgeAppearance, 如果不设置, 默认为nil, TabBar 会透明
    if (@available(iOS 15.0, *)) {
        tabBarVC.tabBar.scrollEdgeAppearance = tabBarVC.tabBar.standardAppearance;
    }
    
    WaterfallViewController *myVC = [[WaterfallViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:myVC];
    myVC.tabBarItem.title = @"QX";

    RotationMapViewController *myVC2 = [[RotationMapViewController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:myVC2];
    myVC2.tabBarItem.title = @"WYR";

    ZWTUnLoginVC *myVC3 = [[ZWTUnLoginVC alloc] init];
    myVC3.tabBarItem.title = @"ZWT";
    
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:myVC3];
    nav3.tabBarItem.title = @"ZWT";
    
    ZWTTaBarItemImage *itemImage = [[ZWTTaBarItemImage alloc] init];
    [itemImage setImageName:@"QX"];
    
    ZWTTaBarItemImage *itemImage2 = [[ZWTTaBarItemImage alloc] init];
    [itemImage2 setImageName:@"WYR"];
    
    ZWTTaBarItemImage *itemImage3 = [[ZWTTaBarItemImage alloc] init];
    [itemImage3 setImageName:@"ZWT"];

    myVC.tabBarItem.image = itemImage.normalImage;
    myVC.tabBarItem.selectedImage = itemImage.selectedImage;
    
    myVC2.tabBarItem.image = itemImage2.normalImage;
    myVC2.tabBarItem.selectedImage = itemImage2.selectedImage;
    
    myVC3.tabBarItem.image = itemImage3.normalImage;
    myVC3.tabBarItem.selectedImage = itemImage3.selectedImage;
    
    NSArray *vcArr = [NSArray arrayWithObjects:nav,nav2,nav3,nil];
    tabBarVC.viewControllers = vcArr;

    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
}

// 防止重复点击
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (_selected && [tabBarController.viewControllers indexOfObject:viewController] == 2) {
        return NO;
    }
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    if (tabBarController.selectedIndex == 2) {
        _selected = YES;
    } else {
        _selected = NO;
    }
}
@end
