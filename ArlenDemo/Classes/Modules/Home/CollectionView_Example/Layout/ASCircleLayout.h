//
//  ASCircleLayout.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/29.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import <UIKit/UIKit.h>


@class ASCircleLayout;

@protocol ASCircleLayoutDelegate <NSObject>
@optional
/**
 返回 item 的大小, 默认 64
 */
- (CGSize)circleLayout:(ASCircleLayout *)circleLayout collectionView:(UICollectionView *)collectionView sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/**
 返回 item 对应的半径 , 默认120
 */
- (CGFloat)circleLayout:(ASCircleLayout *)circleLayout collectionView:(UICollectionView *)collectionView radiusForItemAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface ASCircleLayout : UICollectionViewLayout

- (instancetype)initWithDelegate:(id<ASCircleLayoutDelegate>)delegate;

+ (instancetype)circleLayoutWithDelegate:(id<ASCircleLayoutDelegate>)delegate;

@end
