//
//  ASCollectionViewController.m
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/11.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASCollectionViewController.h"
#import "ASAutoRefreshFooter.h"

@interface ASCollectionViewController ()<ASVerticalFlowLayoutDelegate>

@end

@implementation ASCollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBaseASCollectionViewControllerUI];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
}

- (void)setupBaseASCollectionViewControllerUI
{
    if ([self.parentViewController isKindOfClass:[UINavigationController class]]) {
        UIEdgeInsets contentInset = self.collectionView.contentInset;
        contentInset.top += self.as_navgationBar.as_height;
        self.collectionView.contentInset = contentInset;
    }
    
    UICollectionViewLayout *myLayout = [self collectionViewController:self layoutForCollectionView:self.collectionView];
    self.collectionView.collectionViewLayout = myLayout;
    self.collectionView.backgroundColor = self.view.backgroundColor;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
}

#pragma mark - delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    
    cell.contentView.backgroundColor = [UIColor yellowColor];
    
    cell.contentView.clipsToBounds = YES;
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

#pragma mark - scrollDeleggate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    UIEdgeInsets contentInset = self.collectionView.contentInset;
    contentInset.bottom -= self.collectionView.mj_footer.as_height;
    self.collectionView.scrollIndicatorInsets = contentInset;
    [self.view endEditing:YES];
}


#pragma mark - getter
- (UICollectionView *)collectionView
{
    if(_collectionView == nil)
    {
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:[UICollectionViewFlowLayout new]];
        [self.view addSubview:collectionView];
        _collectionView = collectionView;
        collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _collectionView;
}


#pragma mark - ASCollectionViewControllerDataSource
- (UICollectionViewLayout *)collectionViewController:(ASCollectionViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView
{
    ASVerticalFlowLayout *myLayout = [[ASVerticalFlowLayout alloc] initWithDelegate:self];
    return myLayout;
}


#pragma mark - ASVerticalFlowLayoutDelegate

- (CGFloat)waterflowLayout:(ASVerticalFlowLayout *)waterflowLayout collectionView:(UICollectionView *)collectionView heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)itemWidth
{
    return itemWidth * (arc4random() % 4 + 1);
}


@end
