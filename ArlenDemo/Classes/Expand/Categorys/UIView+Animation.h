//
//  UIView+Animation.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animation)

//缩放动画
+ (void)addScaleAnimationOnView:(UIView *)animationView repeatCount:(float)repeatCount;

//旋转动画
+ (void)addRotateAnimationOnView:(UIView *)animationView;

@end
