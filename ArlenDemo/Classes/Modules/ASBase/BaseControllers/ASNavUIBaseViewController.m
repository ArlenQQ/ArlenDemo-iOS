//
//  ASBaseViewController.m
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/3/29.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASNavUIBaseViewController.h"
#import "ASNavigationBar.h"

@implementation ASNavUIBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    @WeakObj(self);
    [self.navigationItem addObserverBlockForKeyPath:ASKeyPath(self.navigationItem, title) block:^(id  _Nonnull obj, id  _Nonnull oldVal, NSString  *_Nonnull newVal) {
        if (newVal.length > 0 && ![newVal isEqualToString:oldVal]) {
            selfWeak.title = newVal;
        }
    }];
}


#pragma mark - 生命周期
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    self.as_navgationBar.as_width = self.view.as_width;
    [self.view bringSubviewToFront:self.as_navgationBar];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)dealloc {
    [self.navigationItem removeObserverBlocksForKeyPath:ASKeyPath(self.navigationItem, title)];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - DataSource
- (BOOL)navUIBaseViewControllerIsNeedNavBar:(ASNavUIBaseViewController *)navUIBaseViewController {
    return YES;
}

/**头部标题*/
- (NSMutableAttributedString*)asNavigationBarTitle:(ASNavigationBar *)navigationBar {
    return [self changeTitle:self.title ?: self.navigationItem.title];
}

/** 背景图片 */
//- (UIImage *)asNavigationBarBackgroundImage:(ASNavigationBar *)navigationBar
//{
//
//}

/** 背景色 */
- (UIColor *)asNavigationBackgroundColor:(ASNavigationBar *)navigationBar {
    return kColorName(kCX_NAVTHEME);
}

/** 是否显示底部黑线 */
//- (BOOL)asNavigationIsHideBottomLine:(ASNavigationBar *)navigationBar
//{
//    return NO;
//}

/** 导航条的高度 */
- (CGFloat)asNavigationHeight:(ASNavigationBar *)navigationBar {
    return [UIApplication sharedApplication].statusBarFrame.size.height + 44.0;
}


/** 导航条的左边的 view */
//- (UIView *)asNavigationBarLeftView:(ASNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的 view */
//- (UIView *)asNavigationBarRightView:(ASNavigationBar *)navigationBar
//{
//
//}
/** 导航条中间的 View */
//- (UIView *)asNavigationBarTitleView:(ASNavigationBar *)navigationBar
//{
//
//}
/** 导航条左边的按钮 */
//- (UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar
//{
//
//}
/** 导航条右边的按钮 */
//- (UIImage *)asNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ASNavigationBar *)navigationBar
//{
//
//}



#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(ASNavigationBar *)navigationBar {
    NSLog(@"%s", __func__);
}


#pragma mark 自定义代码

- (NSMutableAttributedString *)changeTitle:(NSString *)curTitle
{
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:curTitle ?: @""];
    
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, title.length)];
    
    [title addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:17] range:NSMakeRange(0, title.length)];
    
    return title;
}


- (ASNavigationBar *)as_navgationBar {
    // 父类控制器必须是导航控制器
    if(!_as_navgationBar && [self.parentViewController isKindOfClass:[UINavigationController class]])
    {
        ASNavigationBar *navigationBar = [[ASNavigationBar alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
        [self.view addSubview:navigationBar];
        _as_navgationBar = navigationBar;
        
        navigationBar.dataSource = self;
        navigationBar.asDelegate = self;
        navigationBar.hidden = ![self navUIBaseViewControllerIsNeedNavBar:self];
    }
    return _as_navgationBar;
}




- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    self.as_navgationBar.title = [self changeTitle:title];
}

@end






