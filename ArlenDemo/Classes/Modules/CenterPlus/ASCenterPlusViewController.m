//
//  ASCenterPlusViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASCenterPlusViewController.h"
#import "ASCALayerAnimationViewController.h"

@interface ASCenterPlusViewController ()

@end

@implementation ASCenterPlusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIEdgeInsets edgeInsets = self.tableView.contentInset;
    edgeInsets.bottom += self.tabBarController.tabBar.as_height;
    self.tableView.contentInset = edgeInsets;
    // Do any additional setup after loading the view.
    ASWordArrowItem *item00 = [ASWordArrowItem itemWithTitle:@"CALayer这些牛逼的子类" subTitle:@"iOS动画篇"];
    item00.destVc = [ASCALayerAnimationViewController class];
    
    ASItemSection *section0 = [ASItemSection sectionWithItems:@[item00] andHeaderTitle:@"CALayer" footerTitle:nil];
    [self.sections addObjectsFromArray:@[section0]];
}

#pragma mark -- ASNavigationBarDataSource  --

-(NSMutableAttributedString *)asNavigationBarTitle:(ASNavigationBar *)navigationBar{
    
    return [self changeTitle:@"博客案例"];
}

/** 背景图片 */
//- (UIImage *)asNavigationBarBackgroundImage:(ASNavigationBar *)navigationBar
//{
//
//}

// 背景色
- (UIColor *)asNavigationBackgroundColor:(ASNavigationBar *)navigationBar
{
    return kColorName(kCX_NAVTHEME);
}

// 是否隐藏底部黑线
- (BOOL)asNavigationIsHideBottomLine:(ASNavigationBar *)navigationBar
{
    return YES;
}

/** 导航条的高度 */
//- (CGFloat)asNavigationHeight:(ASNavigationBar *)navigationBar
//{
//
//}


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
//    [leftButton setTitle:@"😁" forState:UIControlStateNormal];
//    return nil;
//}
/** 导航条右边的按钮 */
- (UIImage *)asNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ASNavigationBar *)navigationBar
{
    [rightButton setTitle:@"取消" forState:UIControlStateNormal];
    
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton sizeToFit];
    rightButton.as_width = 60;
    rightButton.height = 44;
    return nil;
}

#pragma mark -- ASNavigationBarDelegate  --
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar
{
    
    [self dismissViewControllerAnimated:true completion:nil];
    NSLog(@"%s", __func__);
}
/** 中间如果是 label 就会有点击 */
-(void)titleClickEvent:(UILabel *)sender navigationBar:(ASNavigationBar *)navigationBar
{
    
    NSLog(@"%s", __func__);
}

#pragma mark private --

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
