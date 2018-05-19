//
//  ASCollectionViewController.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/11.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASBaseViewController.h"
#import "ASElementsFlowLayout.h"
#import "ASVerticalFlowLayout.h"
#import "ASHorizontalFlowLayout.h"


@class ASCollectionViewController;
@protocol ASCollectionViewControllerDataSource <NSObject>

@required
// 需要返回对应的布局
- (UICollectionViewLayout *)collectionViewController:(ASCollectionViewController *)collectionViewController layoutForCollectionView:(UICollectionView *)collectionView;

@end

@interface ASCollectionViewController : ASBaseViewController <UICollectionViewDelegate, UICollectionViewDataSource, ASCollectionViewControllerDataSource>

/** <#digest#> */
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end
