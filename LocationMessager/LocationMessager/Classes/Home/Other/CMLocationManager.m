//
//  CMLocationManager.m
//  LocationMessager
//
//  Created by 23 on 2017/2/7.
//  Copyright © 2017年 23. All rights reserved.
//

#import "CMLocationManager.h"

@interface CMLocationManager() <AMapLocationManagerDelegate>


@end

@implementation CMLocationManager

static id _instance;


#pragma mark - 单例
+(instancetype)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
         _instance = [[self alloc]init];
    });
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (instancetype)copyWithZone:(struct _NSZone *)zone
{
    return _instance;
}

#pragma mark - 初始化定位相关属性
- (instancetype)init
{
    if (self = [super init]) {
        
        // 设置定位最小更新距离方法如下，单位米。当两次定位距离满足设置的最小更新距离时，SDK会返回符合要求的定位结果
        self.distanceFilter = 10;
        
        // 设置返回坐标的时候不带逆地理解码
        self.locatingWithReGeocode = NO;
        
        // iOS 9（不包含iOS 9） 之前设置允许后台定位参数，保持不会被系统挂起
        [self setPausesLocationUpdatesAutomatically:NO];
        
        // iOS 9（包含iOS 9）之后新特性：将允许出现这种场景，同一app中多个locationmanager：一些只能在前台定位，另一些可在后台定位，并可随时禁止其后台定位。
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9) {
            self.allowsBackgroundLocationUpdates = YES;
        }
        
        // 设置代理
        self.delegate = self;
    }
    return self;
}


#pragma mark - AMapLocationManagerDelegate
/**
 *  定位权限状态改变时回调函数
 *
 *  @param manager 定位 AMapLocationManager 类。
 *  @param status 定位权限状态。
 */
- (void)amapLocationManager:(AMapLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    NSLog(@"权限发生变化");
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:
            // 用户还未决定
            NSLog(@"用户还未决定");
            break;
            
        case kCLAuthorizationStatusDenied:
            // 用户拒绝
            NSLog(@"用户拒绝");
            break;
            
        case kCLAuthorizationStatusRestricted:
            // 使用限制
            NSLog(@"使用限制");
            break;
            
        case kCLAuthorizationStatusAuthorizedAlways:
            // 总是授权
            NSLog(@"总是授权");
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            // 使用时允许
            NSLog(@"使用时允许");
            break;
        
        default:
            break;
    }
}


#pragma mark - 工具方法

@end
