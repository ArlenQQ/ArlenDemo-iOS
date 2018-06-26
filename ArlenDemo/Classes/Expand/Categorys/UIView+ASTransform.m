//
//  UIView+ASTransform.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "UIView+ASTransform.h"
#import <objc/runtime.h>

@implementation UIView (ASTransform)

-(void)ASTransform_circleColor_toColor:(UIColor*)toColor Duration:(CGFloat)duration StartPoint:(CGPoint)startPoint{
    CALayer *tempLayer = objc_getAssociatedObject(self, @"tempLayer");
    if (!tempLayer) {
        tempLayer = [[CALayer alloc] init];
        tempLayer.bounds = self.bounds;
        tempLayer.position = self.center;
        tempLayer.backgroundColor = self.backgroundColor.CGColor;
        [self.layer addSublayer:tempLayer];
        objc_setAssociatedObject(self, @"tempLayer", tempLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    //
    tempLayer.contents = nil;
    tempLayer.backgroundColor = toColor.CGColor;
    CGFloat screenHeight = self.frame.size.height;
    CGFloat screenWidth = self.frame.size.width;
    CGRect rect = CGRectMake(startPoint.x, startPoint.y, 2, 2);
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:startPoint radius:sqrt(screenHeight * screenHeight + screenWidth * screenWidth)  startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endPath.CGPath;
    tempLayer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.delegate = self;
    
    animation.fromValue = (__bridge id)(startPath.CGPath);
    animation.toValue = (__bridge id)((endPath.CGPath));
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [animation setValue:@"ASCircleColor_value" forKey:@"ASCircleColor_key"];
    [maskLayer addAnimation:animation forKey:@"ASCircleColor"];
}

-(void)ASTransform_circleImage_toImage:(UIImage*)toImage Duration:(CGFloat)duration StartPoint:(CGPoint)startPoint{
    CALayer *tempLayer = objc_getAssociatedObject(self, @"tempLayer");
    if (!tempLayer) {
        tempLayer = [[CALayer alloc] init];
        tempLayer.bounds = self.bounds;
        tempLayer.position = self.center;
        tempLayer.backgroundColor = self.backgroundColor.CGColor;
        [self.layer addSublayer:tempLayer];
        objc_setAssociatedObject(self, @"tempLayer", tempLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    tempLayer.contents = (id)toImage.CGImage;
    //
    CGFloat screenHeight = self.frame.size.height;
    CGFloat screenWidth = self.frame.size.width;
    CGRect rect = CGRectMake(startPoint.x, startPoint.y, 2, 2);
    UIBezierPath *startPath = [UIBezierPath bezierPathWithOvalInRect:rect];
    UIBezierPath *endPath = [UIBezierPath bezierPathWithArcCenter:startPoint radius:sqrt(screenHeight * screenHeight + screenWidth * screenWidth)  startAngle:0 endAngle:M_PI*2 clockwise:YES];
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = endPath.CGPath;
    tempLayer.mask = maskLayer;
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.delegate = self;
    
    animation.fromValue = (__bridge id)(startPath.CGPath);
    animation.toValue = (__bridge id)((endPath.CGPath));
    animation.duration = 1;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [animation setValue:@"ASCircleImage_value" forKey:@"ASCircleImage_key"];
    [maskLayer addAnimation:animation forKey:@"ASCircleImage"];
}
//
-(void)ASTransForm_beginZoom_max:(CGFloat)max min:(CGFloat)min{
    [UIView animateWithDuration:0.3 animations:^{
        self.transform = CGAffineTransformMakeScale(max, max);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            self.transform = CGAffineTransformMakeScale(min, min);
        } completion:^(BOOL finished) {
            NSNumber *nextStop = objc_getAssociatedObject(self, @"nextAniStop");
            if ([nextStop boolValue]) {
                [UIView animateWithDuration:0.3 animations:^{
                    self.transform = CGAffineTransformMakeScale(1, 1);
                } completion:^(BOOL finished) {
                    self.transform = CGAffineTransformMakeScale(1, 1);
                    objc_setAssociatedObject(self, @"nextAniStop", @(0), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
                }];
            }else{
                [self ASTransForm_beginZoom_max:max min:min];
            }
        }];
    }];
}

-(void)ASTransForm_StopZoom{
    objc_setAssociatedObject(self, @"nextAniStop", @(1), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

//
-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if (flag) {
        CALayer *tempLayer = objc_getAssociatedObject(self, @"tempLayer");
        if ([anim valueForKey:@"ASCircleColor_key"]) {
            self.layer.contents = nil;
            self.backgroundColor = [UIColor colorWithCGColor:tempLayer.backgroundColor];
        }else if ([anim valueForKey:@"ASCircleImage_key"]){
            self.layer.contents = tempLayer.contents;
        }
    }
}


@end
