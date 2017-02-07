//
//  CMHomeMenuView.m
//  LocationMessager
//
//  Created by 23 on 2017/2/7.
//  Copyright © 2017年 23. All rights reserved.
//

#import "CMHomeMenuView.h"

@interface CMHomeMenuView ()

/**更新当前位置按钮 -- left*/
@property(nonatomic,weak) UIButton *locateButton;
/**主菜单按钮 -- center*/
@property(nonatomic,weak) UIButton *menuButton;
/**工具按钮 -- right*/
@property(nonatomic,weak) UIButton *toolButon;


@end

@implementation CMHomeMenuView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupUI];
}


#pragma mark - 设置UI
/**设置UI*/
- (void)setupUI
{
    self.backgroundColor = [UIColor clearColor];
    
    //创建按钮
    UIButton *locateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    locateButton.backgroundColor = [UIColor orangeColor];
    [locateButton addTarget:self action:@selector(locateBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:locateButton];
    self.locateButton = locateButton;
    
    UIButton *menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
    menuButton.backgroundColor = [UIColor orangeColor];
    [self addSubview:menuButton];
    self.menuButton = menuButton;
    
    UIButton *toolButon = [UIButton buttonWithType:UIButtonTypeCustom];
    toolButon.backgroundColor = [UIColor orangeColor];
    [self addSubview:toolButon];
    self.toolButon = toolButon;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat menuBtnWidth = 80;
    CGFloat menuBtnX = 0.5 * (self.cm_width - menuBtnWidth);
    self.menuButton.frame = CGRectMake(menuBtnX, 0, menuBtnWidth, self.cm_height);
    
    self.locateButton.frame = CGRectMake(20, 0, self.cm_height, self.cm_height);
    self.toolButon.frame = CGRectMake(self.cm_width - 20 - self.cm_height, 0, self.cm_height, self.cm_height);
}

#pragma mark - 事件监听
/**定位按钮被点击*/
- (void)locateBtnClicked:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(homeMenuView:didLocateBtnClicked:)]) {
        [self.delegate homeMenuView:self didLocateBtnClicked:button];
    }
}


@end
