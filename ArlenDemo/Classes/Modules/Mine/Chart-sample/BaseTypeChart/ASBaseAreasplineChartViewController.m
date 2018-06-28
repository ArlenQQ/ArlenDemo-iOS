//
//  ASBaseAreasplineChartViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/27.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASBaseAreasplineChartViewController.h"

@interface ASBaseAreasplineChartViewController ()

@end

@implementation ASBaseAreasplineChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - ASNavUIBaseViewControllerDataSource

-(UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar{
    return [UIImage imageNamed:@"navigationbar_back_white"];
}

#pragma mark - ASNavUIBaseViewControllerDelegate

-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar{
    [self.navigationController popViewControllerAnimated:true];
    
}


@end
