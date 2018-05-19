//
//  ASNavigationBar.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/3/31.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import <UIKit/UIKit.h>


@class ASNavigationBar;
// 主要处理导航条
@protocol  ASNavigationBarDataSource<NSObject>

@optional

/**头部标题*/
- (NSMutableAttributedString*)asNavigationBarTitle:(ASNavigationBar *)navigationBar;

/** 背景图片 */
- (UIImage *)asNavigationBarBackgroundImage:(ASNavigationBar *)navigationBar;
 /** 背景色 */
- (UIColor *)asNavigationBackgroundColor:(ASNavigationBar *)navigationBar;
/** 是否显示底部黑线 */
- (BOOL)asNavigationIsHideBottomLine:(ASNavigationBar *)navigationBar;
/** 导航条的高度 */
- (CGFloat)asNavigationHeight:(ASNavigationBar *)navigationBar;


/** 导航条的左边的 view */
- (UIView *)asNavigationBarLeftView:(ASNavigationBar *)navigationBar;
/** 导航条右边的 view */
- (UIView *)asNavigationBarRightView:(ASNavigationBar *)navigationBar;
/** 导航条中间的 View */
- (UIView *)asNavigationBarTitleView:(ASNavigationBar *)navigationBar;
/** 导航条左边的按钮 */
- (UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar;
/** 导航条右边的按钮 */
- (UIImage *)asNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ASNavigationBar *)navigationBar;
@end


@protocol ASNavigationBarDelegate <NSObject>

@optional
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar;
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar;
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(ASNavigationBar *)navigationBar;
@end


@interface ASNavigationBar : UIView

/** 底部的黑线 */
@property (weak, nonatomic) UIView *bottomBlackLineView;

/** <#digest#> */
@property (weak, nonatomic) UIView *titleView;

/** <#digest#> */
@property (weak, nonatomic) UIView *leftView;

/** <#digest#> */
@property (weak, nonatomic) UIView *rightView;

/** <#digest#> */
@property (nonatomic, copy) NSMutableAttributedString *title;

/** <#digest#> */
@property (weak, nonatomic) id<ASNavigationBarDataSource> dataSource;

/** <#digest#> */
@property (weak, nonatomic) id<ASNavigationBarDelegate> asDelegate;

/** <#digest#> */
@property (weak, nonatomic) UIImage *backgroundImage;

@end
