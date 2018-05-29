//
//  ASHorizontalLayoutViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/29.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASHorizontalLayoutViewController.h"

@interface ASHorizontalLayoutViewController ()<ASHorizontalFlowLayoutDelegate>

@end

@implementation ASHorizontalLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectionView.backgroundColor = kColorRandom;
    
    self.collectionView.contentInset = UIEdgeInsetsZero;
    
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.mas_equalTo(UIEdgeInsetsMake(100, 20, 100, 20));
    }];
    
    
}

#pragma mark - ASCollectionViewControllerDataSource

- (UICollectionViewLayout *)collectionViewController:(ASCollectionViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView
{
    ASHorizontalFlowLayout *layout = [[ASHorizontalFlowLayout alloc] initWithDelegate:self];
    
    return layout;
}


#pragma mark - ASHorizontalFlowLayoutDelegate

- (CGFloat)waterflowLayout:(ASHorizontalFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView widthForItemAtIndexPath:(NSIndexPath *)indexPath itemHeight:(CGFloat)itemHeight
{
    
    return (arc4random() % 4 + 1) * itemHeight;
}


- (NSInteger)waterflowLayout:(ASHorizontalFlowLayout *)waterflowLayout linesInCollectionView:(UICollectionView *)collectionView
{
    return 5;
}



#pragma mark - ASNavUIBaseViewControllerDataSource

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


#pragma mark - asNavUIBaseViewControllerDelegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
