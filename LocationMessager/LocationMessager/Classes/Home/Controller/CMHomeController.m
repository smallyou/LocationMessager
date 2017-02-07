//
//  CMHomeController.m
//  LocationMessager
//
//  Created by 23 on 2017/2/7.
//  Copyright © 2017年 23. All rights reserved.
//

#import "CMHomeController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>

#import "CMHomeMenuView.h"


@interface CMHomeController () <CMHomeMenuViewDelegate>
/**地图view*/
@property(nonatomic,weak) MAMapView *mapView;
/**菜单View*/
@property(nonatomic,weak) CMHomeMenuView *menuView;

@end





@implementation CMHomeController

#pragma mark - 懒加载
- (MAMapView *)mapView
{
    if (_mapView == nil) {

        ///初始化地图
        MAMapView *mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
        mapView.showsCompass = YES; //显示指南针图标
        mapView.compassOrigin= CGPointMake(mapView.compassOrigin.x, 64); //设置指南针位置
        mapView.showsScale= YES;  //设置成NO表示不显示比例尺；YES表示显示比例尺
        mapView.scaleOrigin= CGPointMake(mapView.scaleOrigin.x, 64);  //设置比例尺位置
        
        ///把地图添加至view
        [self.view addSubview:mapView];
        
        _mapView = mapView;
    }
    return _mapView;
}

- (CMHomeMenuView *)menuView
{
    if (_menuView == nil) {
        CMHomeMenuView *menuView = [[CMHomeMenuView alloc]init];
        menuView.delegate = self;
        [self.mapView addSubview:menuView];
        _menuView = menuView;
    }
    return _menuView;
}


#pragma mark - 系统回调
- (void)viewDidLoad {
    [super viewDidLoad];
   

    // 设置UI
    [self setupUI];


}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.menuView.frame = CGRectMake(0 , self.view.cm_height - 55 , self.view.cm_width, 35);
}



#pragma mark - 设置UI
/**设置UI*/
- (void)setupUI
{
    // 设置导航条
    self.title = @"定位信使";

    // 显示当前位置
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
    
    
}


#pragma mark - CMHomeMenuViewDelegate
- (void)homeMenuView:(CMHomeMenuView *)menuView didLocateBtnClicked:(UIButton *)locateButton
{
    self.mapView.showsUserLocation = YES;
    self.mapView.userTrackingMode = MAUserTrackingModeFollow;
}

@end
