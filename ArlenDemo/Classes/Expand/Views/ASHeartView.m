//
//  ASHeartView.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASHeartView.h"

@interface ASHeartView ()


@end

@implementation ASHeartView{
    CGFloat t;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadTimer];
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGFloat radius = MIN((self.frame.size.width - self.spaceWidth * 2) / 4, (self.frame.size.height - self.spaceWidth * 2) / 4);
    CGPoint leftCenter = CGPointMake(self.spaceWidth+radius, self.spaceWidth+radius);
    CGPoint rightCenter = CGPointMake(self.spaceWidth+radius*3, self.spaceWidth+radius);
    UIBezierPath *heartLine = [UIBezierPath bezierPathWithArcCenter:leftCenter radius:radius startAngle:M_PI endAngle:0 clockwise:YES];
    [heartLine addArcWithCenter:rightCenter radius:radius startAngle:M_PI endAngle:0 clockwise:YES];
    [heartLine addQuadCurveToPoint:CGPointMake((self.frame.size.width/2), self.frame.size.height-self.spaceWidth*2) controlPoint:CGPointMake(self.frame.size.width-self.spaceWidth, self.frame.size.height*0.6)];
    [heartLine addQuadCurveToPoint:CGPointMake(self.spaceWidth, self.spaceWidth+radius)controlPoint:CGPointMake(self.spaceWidth, self.frame.size.height*0.6)];
    [heartLine setLineCapStyle:kCGLineCapRound];
    [heartLine setLineWidth:self.lineWidth];
    [self.strokeColor set];
    [heartLine stroke];
    [heartLine addClip];
    
    UIBezierPath *waves = [UIBezierPath bezierPath];
    CGPoint startPoint = CGPointMake(self.spaceWidth, (self.frame.size.height-3*self.spaceWidth+self.waveAmplitude*2)*(1-self.rate)+self.spaceWidth-self.waveAmplitude);
    [waves moveToPoint:startPoint];
    for (int i = 0; i<self.frame.size.width-self.spaceWidth*2+self.lineWidth*2; i++) {
        CGPoint middlePoint = CGPointMake(startPoint.x+i-self.lineWidth, startPoint.y+self.waveAmplitude*cos(M_PI/self.velocity*i+t));
        [waves addLineToPoint:middlePoint];
    }
    [waves addLineToPoint:CGPointMake(self.frame.size.width-self.spaceWidth, self.frame.size.height-self.spaceWidth*2)];
    [waves addLineToPoint:CGPointMake(self.spaceWidth, self.frame.size.height-self.spaceWidth*2)];
    [self.fillColor set];
    [waves fill];
}

- (NSInteger) spaceWidth{
    if (!_spaceWidth){
        return MIN(self.frame.size.height,self.frame.size.width)/8;
    }
    return _spaceWidth;
}

- (NSInteger) waveAmplitude{
    if (!_waveAmplitude){
        return 2;
    }
    return _waveAmplitude;
}

- (CGFloat) velocity{
    if (!_velocity){
        return 50;
    }
    return _velocity;
}

- (CGFloat)lineWidth{
    if (!_lineWidth) {
        return 1;
    }
    return _lineWidth;
}

- (UIColor *)strokeColor{
    if(!_strokeColor){
        return [UIColor redColor];
    }
    return _strokeColor;
}

- (UIColor *) fillColor{
    if (!_fillColor){
        return [UIColor redColor];
    }
    return _fillColor;
}

- (void)loadTimer{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)timerAction{
    t += M_PI/self.velocity;
    if (t == M_PI) {
        t = 0;
    }
    [self setNeedsDisplay];
}

@end
