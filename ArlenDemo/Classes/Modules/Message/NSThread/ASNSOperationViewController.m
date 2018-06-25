//
//  ASNSOperationViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/25.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASNSOperationViewController.h"

@interface ASNSOperationViewController ()

@end

@implementation ASNSOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
