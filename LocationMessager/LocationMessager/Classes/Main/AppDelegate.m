//
//  AppDelegate.m
//  LocationMessager
//
//  Created by 23 on 2017/2/7.
//  Copyright © 2017年 23. All rights reserved.
//

#import "AppDelegate.h"
#import <AMapFoundationKit/AMapFoundationKit.h>

#import "CMHomeController.h"
#import "CMLocationManager.h"



@interface AppDelegate ()


@end

@implementation AppDelegate

#pragma mark - 系统回调方法
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 配置启动相关
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    CMHomeController *vc = [[CMHomeController alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    window.rootViewController = nav;
    [window makeKeyAndVisible];
    window.backgroundColor = [UIColor whiteColor];
    self.window = window;
    
    
    // 设置第三方
    [self setupThirdToolWithOptions:launchOptions];
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




#pragma mark - 自定义方法
/**设置第三方相关*/
- (void)setupThirdToolWithOptions:(NSDictionary *)launchOptions
{
    //1 设置高德地图
    [AMapServices sharedServices].apiKey = CMAMapAppKey;
    
}


@end
