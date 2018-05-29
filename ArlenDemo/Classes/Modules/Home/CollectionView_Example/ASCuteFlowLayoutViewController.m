 //
//  ASCuteFlowLayoutViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/29.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASCuteFlowLayoutViewController.h"
#import "ASCircleLayout.h"
#import "ASGirdLayout.h"
#import "ASLineFlowLayout.h"

@interface ASCuteFlowLayoutViewController ()
@property (nonatomic, strong) NSMutableArray<UIImage *> *images;
@end

@implementation ASCuteFlowLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fd_interactivePopDisabled = YES;
    UICollectionViewLayout *lineFlowLayout = [[ASCircleLayout alloc] init];
    self.collectionView.collectionViewLayout = lineFlowLayout;
    self.collectionView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight * 0.8);
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"点我切换布局";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    [self.view addSubview:label];
    [label sizeToFit];
    label.textAlignment = NSTextAlignmentCenter;
    label.frame = CGRectMake(0, CGRectGetMaxY(self.collectionView.frame) + 10, kScreenWidth, label.height);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if([self.collectionView.collectionViewLayout isKindOfClass:[ASGirdLayout class]])
    {
        ASLineFlowLayout *lineLayout = [[ASLineFlowLayout alloc] init];
        lineLayout.itemSize = CGSizeMake(100, 100);
        [self.collectionView setCollectionViewLayout:lineLayout  animated:YES];
        
    }else if ([self.collectionView.collectionViewLayout isKindOfClass:[ASCircleLayout class]])
    {
        ASGirdLayout *gird = [[ASGirdLayout alloc] init];
        [self.collectionView setCollectionViewLayout:gird animated:YES];
        
    } else {
        
        [self.collectionView setCollectionViewLayout:[[ASCircleLayout alloc] initWithDelegate:self] animated:YES];
        
    }
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    
    cell.contentView.layer.contents = (id)self.images[indexPath.item].CGImage;
    
    cell.contentView.layer.borderColor = [UIColor whiteColor].CGColor;
    cell.contentView.layer.borderWidth = 5;
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.images removeObjectAtIndex:indexPath.item];
    [self.collectionView deleteItemsAtIndexPaths:@[indexPath]];
}

- (NSMutableArray *)images
{
    if(_images == nil)
    {
        _images = [NSMutableArray array];
        
        for (NSInteger i = 1; i < 21; i++) {
            
            [_images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%zd", i]]];
        }
    }
    return _images;
}


#pragma mark - ASCircleLayoutDelegate
-(CGFloat)circleLayout:(ASCircleLayout *)circleLayout collectionView:(UICollectionView *)collectionView radiusForItemAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
- (CGSize)circleLayout:(ASCircleLayout *)circleLayout collectionView:(UICollectionView *)collectionView sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(62, 62);
}


#pragma mark - ASNavUIBaseViewControllerDataSource

/** 导航条左边的按钮 */
- (UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar
{
    return [UIImage imageNamed:@"navigationbar_back_white"];
}

#pragma mark - ASNavUIBaseViewControllerDelegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
