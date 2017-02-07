//
//  CMLocationManager.h
//  LocationMessager
//
//  Created by 23 on 2017/2/7.
//  Copyright © 2017年 23. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapLocationKit/AMapLocationKit.h>

@interface CMLocationManager : AMapLocationManager

+(instancetype)shareManager;

@end
