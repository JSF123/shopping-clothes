//
//  AppDelegate.m
//  ShoppingClothes
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeAgeVC.h"
#import "ItemVC.h"
#import "CollocationViewController.h"
#import "SchoolVC.h"
#import "DDMenuController.h"
//#import "LeftController.h"
#import "RightController.h"
#import "MyVC.h"
#import "MyViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    //UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UITabBarController *tabBar = [[UITabBarController alloc]init];
    
   CollocationViewController * collocation = [CollocationViewController new];
    collocation.tabBarItem.title = @"搭配";
    collocation.tabBarItem.image = [UIImage imageNamed:@"bottom_dapei_icon@2x"];
    collocation.tabBarItem.selectedImage = [UIImage imageNamed:@"bottom_dapei_icon_on@3x"];
    
    ItemVC * itemVC = [ItemVC new];
    itemVC.tabBarItem.title = @"社区";
    itemVC.tabBarItem.image = [UIImage imageNamed:@"bottom_bbs_icon@3x"];
    itemVC.tabBarItem.selectedImage = [UIImage imageNamed:@"bottom_bbs_icon_on@3x"];
    
    SchoolVC * school = [SchoolVC new];
    school.tabBarItem.title = @"购物车";
    school.tabBarItem.image = [UIImage imageNamed:@"botton_head_shoppingcar@3x"];
    school.tabBarItem.selectedImage = [UIImage imageNamed:@"bottom_shopping_icon_on@3x"];
    

    MyVC* myvc = [MyVC new];
    myvc.tabBarItem.title = @"我的";
    myvc.tabBarItem.image = [UIImage imageNamed:@"bottom_like_icon@3x"];
    myvc.tabBarItem.selectedImage = [UIImage imageNamed:@"bottom_like_icon_on@3x"];
    
    //UINavigationController *ngv = [[UINavigationController alloc]initWithRootViewController:tabBar];
    
    UINavigationController * homeVC = [[UINavigationController alloc]initWithRootViewController:[HomeAgeVC new]];
    DDMenuController *rootController = [[DDMenuController alloc] initWithRootViewController:homeVC];
   
    rootController.tabBarItem.title = @"首页";
    rootController.tabBarItem.image = [UIImage imageNamed:@"button_head_home@2x"];
    rootController.tabBarItem.selectedImage = [UIImage imageNamed:@"bottom_home_icon_on@3x"];
    _menuController = rootController;
    
    MyViewController *leftController = [[MyViewController alloc] init];
    rootController.leftViewController = leftController;
    
    RightController *rightController = [[RightController alloc] init];
    rootController.rightViewController = rightController;
    tabBar.viewControllers = @[rootController,collocation,itemVC,school,myvc];
    
    self.window.rootViewController = tabBar;
    //self.window.rootViewController = rootController;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //self.window.rootViewController = ngv;
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
