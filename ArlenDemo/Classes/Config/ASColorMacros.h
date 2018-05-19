//
//  ASColorMacros.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/17.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#ifndef ASColorMacros_h
#define ASColorMacros_h


#define kColorName(name) [UIColor hexColor:[NSString stringWithFormat:@"%@", name]]
#define kColorRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.90 alpha:1]
#define kColorRandom [UIColor colorWithHue: (arc4random() % 256 / 256.0) saturation:((arc4random()% 128 / 256.0 ) + 0.5) brightness:(( arc4random() % 128 / 256.0 ) + 0.5) alpha:1]

#define kCX_NAVTHEME @"FFA95E"
#define kCX_THEME @"FFF4DA"
#define kC0_26A6FF @"26A6FF"
#define kC1_333333 @"333333"
#define kC2_666666 @"666666"
#define kC3_999999 @"999999"
#define kC4_B4B4B4 @"B4B4B4"
#define kC5_DDDDDD @"DDDDDD"
#define kC6_BBBBBB @"BBBBBB"
#define kC7_FFB24D @"FFB24D"
#define kC8_C7C7CD @"C7C7CD"
#define kC9_EEEEEE @"EEEEEE"
#define kC10_E8E8E8 @"E8E8E8"
#define kC11_FFFFFF_A_V @"FFFFFF"
#define kC13_F1F5F8 @"F1F5F8"
#define kC14_2993FF @"2993FF"
#define kC15_FEC746 @"FEC746"
#define kC16_787ADF @"787ADF"
#define KC17_D2D2DB @"D2D2DB"

//新增消息
/** 红色 */
#define kC17_FE3950 @"FE3950"
/** 黄色 */
#define kC18_FFC746 @"FFC746"
/** 绿色 */
#define kC19_71E46B @"71E46B"
/** 紫色 */
#define kC20_787ADF @"787ADF"
/** 橙色 */
#define kC21_FFA95E @"FFA95E"

///////////msg color/////////
/** msg绿色 */
#define kC31_19CF4C @"19CF4C"
#define kC32_E6F6E0 @"E6F6E0"
/** msg 红色 */
#define kC33_FF3950 @"FF3950"
#define kC34_FFD7DC @"FFD7DC"
/** msg 蓝色 */
#define kC35_0086F1 @"0086F1"
#define kC36_CCE7FC @"CCE7FC"
/** msg 黄色 */
#define kC37_FFA95E @"FFA95E"
#define kC38_FFF4DA @"FFF4DA"


#endif /* ASColorMacros_h */
