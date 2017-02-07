//
//  UIView+CMExtension.m
//  LocationMessager
//
//  Created by 23 on 2017/2/7.
//  Copyright © 2017年 23. All rights reserved.
//

#import "UIView+CMExtension.h"

@implementation UIView (CMExtension)

- (void)setCm_x:(CGFloat)cm_x
{
    CGRect frame = self.frame;
    frame.origin.x = cm_x;
    self.frame = frame;
}

-(CGFloat)cm_x
{
    return self.frame.origin.x;
}

- (void)setCm_y:(CGFloat)cm_y
{
    CGRect frame = self.frame;
    frame.origin.y = cm_y;
    self.frame = frame;
}

-(CGFloat)cm_y
{
    return self.frame.origin.y;
}

- (void)setCm_width:(CGFloat)cm_width
{
    CGRect frame = self.frame;
    frame.size.width = cm_width;
    self.frame = frame;
}

- (CGFloat)cm_width
{
    return self.frame.size.width;
}

- (void)setCm_height:(CGFloat)cm_height
{
    CGRect frame = self.frame;
    frame.size.height = cm_height;
    self.frame = frame;
}

- (CGFloat)cm_height
{
    return self.frame.size.height;
}



@end
