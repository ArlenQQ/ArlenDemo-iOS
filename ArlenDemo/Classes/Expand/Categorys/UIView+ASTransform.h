//
//  UIView+ASTransform.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ASTransform)<CAAnimationDelegate>

-(void)ASTransform_circleColor_toColor:(UIColor*)toColor Duration:(CGFloat)duration StartPoint:(CGPoint)startPoint;

-(void)ASTransform_circleImage_toImage:(UIImage*)toImage Duration:(CGFloat)duration StartPoint:(CGPoint)startPoint;

-(void)ASTransForm_beginZoom_max:(CGFloat)max min:(CGFloat)min;
-(void)ASTransForm_StopZoom;

@end
