//
//  ASHorizontalFlowLayout.m
//  瀑布流完善接口
//
//  Created by apple on 16/7/31.
//  Copyright © 2016年 Arlen.S. All rights reserved.
//

#import "ASHorizontalFlowLayout.h"

#define ASXX(x) floorf(x)
#define ASXS(s) ceilf(s)

static const NSInteger AS_Lines_ = 3;
static const CGFloat AS_XMargin_ = 10;
static const CGFloat AS_YMargin_ = 10;
static const UIEdgeInsets AS_EdgeInsets_ = {10, 10, 10, 10};

@interface ASHorizontalFlowLayout()

/** 所有的cell的attrbts */
@property (nonatomic, strong) NSMutableArray<UICollectionViewLayoutAttributes *> *as_AtrbsArray;

/** 每一列的最后的高度 */
@property (nonatomic, strong) NSMutableArray<NSNumber *> *as_LinesWidthArray;

- (NSInteger)lines;

- (CGFloat)xMarginAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)yMargin;

- (UIEdgeInsets)edgeInsets;

@end

@implementation ASHorizontalFlowLayout



/**
 *  刷新布局的时候回重新调用
 */
- (void)prepareLayout
{
    [super prepareLayout];
    
    //如果重新刷新就需要移除之前存储的高度
    [self.as_LinesWidthArray removeAllObjects];
    
    //复赋值以顶部的高度, 并且根据行数
    for (NSInteger i = 0; i < self.lines; i++) {
        [self.as_LinesWidthArray addObject:@(self.edgeInsets.left)];
    }
    
    // 移除以前计算的cells的attrbs
    [self.as_AtrbsArray removeAllObjects];
    
    // 并且重新计算, 每个cell对应的atrbs, 保存到数组
    for (NSInteger i = 0; i < [self.collectionView numberOfItemsInSection:0]; i++)
    {
        [self.as_AtrbsArray addObject:[self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]]];
    }
}


/**
 *在这里边所处每个cell对应的位置和大小
 */
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *atrbs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    CGFloat h = 1.0 * (self.collectionView.frame.size.height - self.edgeInsets.top - self.edgeInsets.bottom - self.yMargin * (self.lines - 1)) / self.lines;
    
    h = ASXX(h);
    
    // 宽度由外界决定, 外界必须实现这个方法
    CGFloat w = [self.delegate waterflowLayout:self collectionView:self.collectionView widthForItemAtIndexPath:indexPath itemHeight:h];
    
    // 拿到最后的高度最小的那一列, 假设第0列最小
   __block NSInteger indexLine = 0;
   __block CGFloat minLineW = [self.as_LinesWidthArray[indexLine] doubleValue];
    
    [self.as_LinesWidthArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        CGFloat lineW = obj.doubleValue;
        if(minLineW > lineW)
        {
            minLineW = lineW;
            indexLine = idx;
        }
    }];
    
    
    CGFloat x = [self xMarginAtIndexPath:indexPath] + minLineW;
    
    if (minLineW == self.edgeInsets.left) {
        x = self.edgeInsets.left;
    }
    
    CGFloat y = self.edgeInsets.top + (self.yMargin + h) * indexLine;
    
    // 赋值frame
    atrbs.frame = CGRectMake(x, y, w, h);
    
    // 覆盖添加完后那一列;的最新宽度
    self.as_LinesWidthArray[indexLine] = @(CGRectGetMaxX(atrbs.frame));
    
    return atrbs;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return self.as_AtrbsArray;
}


- (CGSize)collectionViewContentSize
{
   __block CGFloat maxColW = [self.as_LinesWidthArray[0] doubleValue];

    [self.as_LinesWidthArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (maxColW < [obj doubleValue]) {
            maxColW = [obj doubleValue];
        }
        
    }];
    
    return CGSizeMake(maxColW + self.edgeInsets.right, self.collectionView.frame.size.height);
}


- (NSMutableArray *)as_AtrbsArray
{
    if(_as_AtrbsArray == nil)
    {
        _as_AtrbsArray = [NSMutableArray array];
    }
    return _as_AtrbsArray;
}

- (NSMutableArray *)as_LinesWidthArray
{
    if(_as_LinesWidthArray == nil)
    {
        _as_LinesWidthArray = [NSMutableArray array];
    }
    return _as_LinesWidthArray;
}

- (NSInteger)lines
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:linesInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self linesInCollectionView:self.collectionView];
    }
    else
    {
        return AS_Lines_;
    }
}

- (CGFloat)xMarginAtIndexPath:(NSIndexPath *)indexPath
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:collectionView:columnsMarginForItemAtIndexPath:)])
    {
        return [self.delegate waterflowLayout:self collectionView:self.collectionView columnsMarginForItemAtIndexPath:indexPath];
    }
    else
    {
        return AS_XMargin_;
    }
}

- (CGFloat)yMargin
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:linesMarginInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self linesMarginInCollectionView:self.collectionView];
    }else
    {
        return AS_YMargin_;
    }
}

- (UIEdgeInsets)edgeInsets
{
    if([self.delegate respondsToSelector:@selector(waterflowLayout:edgeInsetsInCollectionView:)])
    {
        return [self.delegate waterflowLayout:self edgeInsetsInCollectionView:self.collectionView];
    }
    else
    {
        return AS_EdgeInsets_;
    }
}

- (id<ASHorizontalFlowLayoutDelegate>)delegate
{
    return (id<ASHorizontalFlowLayoutDelegate>)self.collectionView.dataSource;
}

- (instancetype)initWithDelegate:(id<ASHorizontalFlowLayoutDelegate>)delegate
{
    if (self = [super init]) {
        
    }
    return self;
}


+ (instancetype)flowLayoutWithDelegate:(id<ASHorizontalFlowLayoutDelegate>)delegate
{
    return [[self alloc] initWithDelegate:delegate];
}

@end
