//
//  ASFunctionViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASFunctionViewController.h"
#import "ASCALayerAnimationViewController.h"
#import "ASH5JSBridgeViewController.h"
#import "ASH5NativeViewController.h"

@interface ASFunctionViewController ()

@end

@implementation ASFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ASWordArrowItem *item01 = [ASWordArrowItem itemWithTitle:@"H5与原生交互（JSBridge）" subTitle:@"自定义JSBridge"];
    item01.destVc = [ASH5JSBridgeViewController class];
    
    ASWordArrowItem *item02 = [ASWordArrowItem itemWithTitle:@"H5与原生交互（Native）" subTitle:@"Native"];
    item02.destVc = [ASH5NativeViewController class];
    
    ASItemSection *section0 = [ASItemSection sectionWithItems:@[item01,item02] andHeaderTitle:@"WKWebView H5与原生混合开发H5与原生混合开发" footerTitle:@""];
    [self.sections addObject:section0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
