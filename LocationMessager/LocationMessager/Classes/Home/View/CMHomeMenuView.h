//
//  CMHomeMenuView.h
//  LocationMessager
//
//  Created by 23 on 2017/2/7.
//  Copyright © 2017年 23. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CMHomeMenuView;

@protocol CMHomeMenuViewDelegate <NSObject>

/**定位按钮被点击*/
- (void)homeMenuView:(CMHomeMenuView *)menuView didLocateBtnClicked:(UIButton *)locateButton;

@end

@interface CMHomeMenuView : UIView

@property(nonatomic,weak) id<CMHomeMenuViewDelegate> delegate;

@end
