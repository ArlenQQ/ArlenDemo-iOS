//
//  ASMacros.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/17.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#ifndef ASMacros_h
#define ASMacros_h

#ifdef DEBUG
#define ASLog(...) printf("[%s] %s [第%d行]: %s\n", __TIME__ ,__PRETTY_FUNCTION__ ,__LINE__, [[NSString stringWithFormat:__VA_ARGS__] UTF8String])
#else
#define ASLog(...) 
#endif


//********************* UI ************************

//屏幕尺寸
#define UI_IS_IPHONE            ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
#define UI_IS_IPHONE5           (UI_IS_IPHONE && kScreenHeight == 568.0)
#define UI_IS_IPHONE6           (UI_IS_IPHONE && kScreenHeight == 667.0)
#define UI_IS_IPHONE6P          (UI_IS_IPHONE && kScreenHeight == 736.0 || kScreenWidth == 736.0) // Both orientations
#define UI_IS_IPHONEX           (UI_IS_IPHONE && kScreenHeight == 812.0)

//不同屏幕尺寸字体适配
#define kScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / 375.0)
#define kScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / 667.0)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]

//设备是iPhoneX 刘海高出部分
#define kIPhoneXNavigationBarOffSetY 24

//********************* 常量 ***********************
//获取当前版本号
#define kMyVersion      [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//每页记录数量，默认10
#define kNums PageMaxCount
//列表请求 每页的条数
#define PageMaxCount 10
//********************* 通用方法 ********************

//是否是空对象
#define ASIsEmpty(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))

//强弱引用
#define ASWeakObj(o) autoreleasepool{} __weak typeof(o) o##Weak = o;
#define ASStrongObj(o) autoreleasepool{} __strong typeof(o) o = o##Weak;

//系统版本
#define IOSVersion      [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS7_OR_LATER   ( IOSVersion >= 7.0 )
#define IOS11_OR_LATER   ( IOSVersion >= 11.0 )

//属性转字符串
#define ASKeyPath(obj, key) @(((void)obj.key, #key))

//由角度转换弧度
#define kDegreesToRadian(x)      (M_PI * (x) / 180.0)

//由弧度转换角度
#define kRadianToDegrees(radian) (radian * 180.0) / (M_PI)


#endif /* ASMacros_h */
