//
//  ASCircleLayout.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/29.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASCircleLayout.h"

static const CGSize AS_itemSize_ = {64, 64};
static const CGFloat AS_radius_ = 120;

@interface ASCircleLayout ()

@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *atrbsArray;

- (CGSize)itemSizeAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)radiusAtIndexPath:(NSIndexPath *)indexPath;

@end

@implementation ASCircleLayout


- (NSMutableArray *)atrbsArray
{
    if(_atrbsArray == nil)
    {
        _atrbsArray = [NSMutableArray array];
    }
    return _atrbsArray;
}

- (void)prepareLayout
{
    [super prepareLayout];
    
    [self.atrbsArray removeAllObjects];
    
    NSUInteger count = [self.collectionView numberOfItemsInSection:0];
    
    for (NSInteger i = 0; i < count; i++) {
        
        UICollectionViewLayoutAttributes *atrb = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];
        
        [self.atrbsArray addObject:atrb];
    }
    
}



- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *newAtrb = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGSize  size = [self itemSizeAtIndexPath:indexPath];
    
    size.width = ceilf(size.width);
    size.height = ceilf(size.height);
    
    // center
    CGPoint oCenter =  CGPointMake(self.collectionView.frame.size.width * 0.5, self.collectionView.frame.size.height * 0.5);
    
    // 360°, 平均度数
    CGFloat angle = M_PI * 2 / [self.collectionView numberOfItemsInSection:0] * indexPath.item;
    
    // 半径
    CGFloat radius = [self radiusAtIndexPath:indexPath];
    
    CGFloat realX = oCenter.x + sin(angle) * radius;
    CGFloat realY = oCenter.y - cos(angle) * radius;
    
    newAtrb.size = size;
    
    if([self.collectionView numberOfItemsInSection:0] == 1)
    {
        newAtrb.center = oCenter;
    }
    else
    {
        newAtrb.center = CGPointMake(realX, realY);
    }
    return newAtrb;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.atrbsArray;
}

- (CGSize)collectionViewContentSize
{
    return self.collectionView.frame.size;
}


#pragma mark - getter
- (CGSize)itemSizeAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(circleLayout:collectionView:sizeForItemAtIndexPath:)]) {
        return [self.delegate circleLayout:self collectionView:self.collectionView sizeForItemAtIndexPath:indexPath];
    }
    return AS_itemSize_;
}

- (CGFloat)radiusAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(circleLayout:collectionView:radiusForItemAtIndexPath:)]) {
        return [self.delegate circleLayout:self collectionView:self.collectionView radiusForItemAtIndexPath:indexPath];
    }
    return AS_radius_;
}

#pragma mark - delegate

- (id<ASCircleLayoutDelegate>)delegate
{
    return (id<ASCircleLayoutDelegate>)self.collectionView.dataSource;
}

- (instancetype)initWithDelegate:(id<ASCircleLayoutDelegate>)delegate {
    if (self = [super init]) {
        
    }
    return self;
}

+ (instancetype)circleLayoutWithDelegate:(id<ASCircleLayoutDelegate>)delegate {
    return [[self alloc] initWithDelegate:delegate];
}

@end
