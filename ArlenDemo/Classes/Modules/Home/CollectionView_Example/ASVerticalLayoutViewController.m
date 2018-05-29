//
//  ASVerticalLayoutViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/29.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASVerticalLayoutViewController.h"

@interface ASVerticalLayoutViewController ()

@end

@implementation ASVerticalLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - ASNavUIBaseViewControllerDataSource

/**头部标题*/
- (NSMutableAttributedString*)asNavigationBarTitle:(ASNavigationBar *)navigationBar
{
    return [self changeTitle:@"CollectionView默认是垂直流水"];
}


/** 导航条左边的按钮 */
- (UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar
{
    
//    [leftButton setTitle:@"< 返回" forState:UIControlStateNormal];
//    
//    leftButton.as_width = 60;
//    
//    [leftButton setTitleColor:kColorRandom forState:UIControlStateNormal];
    
    return [UIImage imageNamed:@"navigationbar_back_white"];
}



#pragma mark - ASNavUIBaseViewControllerDelegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
