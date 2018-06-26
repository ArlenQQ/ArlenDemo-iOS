//
//  ASHeartView.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASHeartView : UIView

/** 波纹占比 */
@property (nonatomic,assign) CGFloat rate;
/** 填充色 */
@property (nonatomic,strong) UIColor *fillColor;
/** 线色 */
@property (nonatomic,strong) UIColor *strokeColor;
/** 线宽 */
@property (nonatomic,assign) CGFloat lineWidth;
/** 空白宽 默认控件frame的1/8*/
@property (nonatomic,assign) NSInteger spaceWidth;
/** 波幅 默认2*/
@property (nonatomic,assign) NSInteger waveAmplitude;
/** 波动速度 默认50 越小越快*/
@property (nonatomic,assign) CGFloat velocity; 

@end
