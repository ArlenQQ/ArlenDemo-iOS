//
//  UIView+ASFrame.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/29.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ASFrame)

@property (nonatomic) CGFloat as_x;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat as_y;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat as_right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat as_bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat as_width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat as_height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat as_centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat as_centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint as_origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  as_size;        ///< Shortcut for frame.size.

@end
