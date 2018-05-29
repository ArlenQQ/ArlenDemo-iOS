 //
//  ASElementsCollectionViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/29.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASElementsCollectionViewController.h"

@interface ASElementsCollectionViewController ()<ASElementsFlowLayoutDelegate>

@property (nonatomic, strong) NSMutableArray<NSValue *> *elementsHight;

@end

@implementation ASElementsCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"app首页布局";
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.elementsHight.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = kColorRandom;
    
    
    if (![cell.contentView viewWithTag:100]) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        label.tag = 100;
        label.textColor = [UIColor redColor];
        label.font = [UIFont boldSystemFontOfSize:17];
        [cell.contentView addSubview:label];
    }
    
    UILabel *label = [cell.contentView viewWithTag:100];
    
    label.text = [NSString stringWithFormat:@"%zd", indexPath.item];
    
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    NSLog(@"%zd", indexPath.item);
}

#pragma mark - LMJElementsFlowLayoutDelegate

- (CGSize)waterflowLayout:(ASElementsFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return self.elementsHight[indexPath.item].CGSizeValue;
}

- (UIEdgeInsets)waterflowLayout:(ASElementsFlowLayout *)waterflowLayout edgeInsetsInCollectionView:(UICollectionView *)collectionView
{
    return UIEdgeInsetsMake(1, 10, 10, 10);
}



#pragma mark - LMJCollectionViewControllerDataSource

- (UICollectionViewLayout *)collectionViewController:(ASCollectionViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView
{
    ASElementsFlowLayout *elementsFlowLayout = [[ASElementsFlowLayout alloc] initWithDelegate:self];
    
    return elementsFlowLayout;
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
/** 导航条右边的按钮 */
- (UIImage *)asNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ASNavigationBar *)navigationBar
{
    [rightButton setTitle:@"改变头图高度" forState:UIControlStateNormal];
    
    rightButton.as_width = 120;
    
    [rightButton setTitleColor:kColorRandom forState:UIControlStateNormal];
    
    return nil;
}



#pragma mark - Delegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar
{
    [self.navigationController popViewControllerAnimated:YES];
}
/** 右边的按钮的点击 */
-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar
{
    [self.elementsHight replaceObjectAtIndex:0 withObject:[NSValue valueWithCGSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) * 0.5, 44)]];
    
    [self.collectionView reloadData];
}


- (NSMutableArray<NSValue *> *)elementsHight
{
    if(_elementsHight == nil)
    {
        _elementsHight = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 200; i++) {
            
            if (i == 0) {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 150)]];
                
            }else if (i == 1)
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, 100)]];
                
            }else if (i == 2)
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 50, 60)]];
                
            }else if (i == 3)
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10, 300)]];
            }else
            {
                
                [_elementsHight addObject:[NSValue valueWithCGSize:CGSizeMake(([UIScreen mainScreen].bounds.size.width - 30) * 0.5, ([UIScreen mainScreen].bounds.size.width - 30) * 0.5 * 0.8)]];
            }
            
            
            
        }
    }
    return _elementsHight;
}



@end
