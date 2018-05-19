//
//  UIView+ASFrame.m
//  PLMMPRJK
//
//  Created by HuXuPeng on 2017/4/29.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "UIView+ASFrame.h"

@implementation UIView (ASFrame)

- (CGFloat)as_x {
    return self.frame.origin.x;
}

- (void)setAs_x:(CGFloat)as_x {
    CGRect frame = self.frame;
    frame.origin.x = as_x;
    self.frame = frame;
}

- (CGFloat)as_y {
    return self.frame.origin.y;
}

- (void)setAs_y:(CGFloat)as_y {
    CGRect frame = self.frame;
    frame.origin.y = as_y;
    self.frame = frame;
}

- (CGFloat)as_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setAs_right:(CGFloat)as_right {
    CGRect frame = self.frame;
    frame.origin.x = as_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)as_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setAs_bottom:(CGFloat)as_bottom {
    
    CGRect frame = self.frame;
    
    frame.origin.y = as_bottom - frame.size.height;
    
    self.frame = frame;
}

- (CGFloat)as_width {
    return self.frame.size.width;
}

- (void)setAs_width:(CGFloat)as_width {
    CGRect frame = self.frame;
    frame.size.width = as_width;
    self.frame = frame;
}

- (CGFloat)as_height {
    return self.frame.size.height;
}

- (void)setAs_height:(CGFloat)as_height {
    CGRect frame = self.frame;
    frame.size.height = as_height;
    self.frame = frame;
}

- (CGFloat)as_centerX {
    return self.center.x;
}

- (void)setAs_centerX:(CGFloat)as_centerX {
    self.center = CGPointMake(as_centerX, self.center.y);
}

- (CGFloat)as_centerY {
    return self.center.y;
}

- (void)setAs_centerY:(CGFloat)as_centerY {
    self.center = CGPointMake(self.center.x, as_centerY);
}

- (CGPoint)as_origin {
    return self.frame.origin;
}

- (void)setAs_origin:(CGPoint)as_origin {
    CGRect frame = self.frame;
    frame.origin = as_origin;
    self.frame = frame;
}

- (CGSize)as_size {
    return self.frame.size;
}

- (void)setAs_size:(CGSize)as_size {
    CGRect frame = self.frame;
    frame.size = as_size;
    self.frame = frame;
}

@end
