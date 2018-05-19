//
//  ASHomeViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASHomeViewController.h"

@interface ASHomeViewController ()

@end

@implementation ASHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITabBarItem *homeItem = self.navigationController.tabBarItem;
    [homeItem setBadgeValue:@"3"];
}

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
