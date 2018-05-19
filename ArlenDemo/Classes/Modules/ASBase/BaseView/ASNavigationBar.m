//
//  ASNavigationBar.m
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/3/31.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASNavigationBar.h"


#define kStatusBarHeight [UIApplication sharedApplication].statusBarFrame.size.height

#define kDefaultNavBarHeight ([UIApplication sharedApplication].statusBarFrame.size.height + 44.0)

#define kSmallTouchSizeHeight 44.0

#define kLeftRightViewSizeMinWidth 60.0

#define kLeftMargin 0.0

#define kRightMargin 0.0

#define kNavBarCenterY(H) ((self.frame.size.height - kStatusBarHeight - H) * 0.5 + kStatusBarHeight)

#define kViewMargin 5.0

@implementation ASNavigationBar


#pragma mark - system

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupASNavigationBarUIOnce];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupASNavigationBarUIOnce];
}



- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.superview bringSubviewToFront:self];
    
    self.leftView.frame = CGRectMake(0, kStatusBarHeight, self.leftView.as_width, self.leftView.as_height);
    
    self.rightView.frame = CGRectMake(self.as_width - self.rightView.as_width, kStatusBarHeight, self.rightView.as_width, self.rightView.as_height);
    
    self.titleView.frame = CGRectMake(0, kStatusBarHeight + (44.0 - self.titleView.as_height) * 0.5, MIN(self.as_width - MAX(self.leftView.as_width, self.rightView.as_width) * 2 - kViewMargin * 2, self.titleView.as_width), self.titleView.as_height);
    
    self.titleView.as_x = (self.as_width * 0.5 - self.titleView.as_width * 0.5);
    
    self.bottomBlackLineView.frame = CGRectMake(0, self.as_height, self.as_width, 0.5);

}



#pragma mark - Setter
- (void)setTitleView:(UIView *)titleView
{
    [_titleView removeFromSuperview];
    [self addSubview:titleView];
    
    _titleView = titleView;
    
    __block BOOL isHaveTapGes = NO;
    
    [titleView.gestureRecognizers enumerateObjectsUsingBlock:^(__kindof UIGestureRecognizer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[UITapGestureRecognizer class]]) {
            
            isHaveTapGes = YES;
            
            *stop = YES;
        }
    }];
    
    if (!isHaveTapGes) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(titleClick:)];
        
        [titleView addGestureRecognizer:tap];
    }
    
    
    [self layoutIfNeeded];
}




- (void)setTitle:(NSMutableAttributedString *)title
{
    // bug fix
    if ([self.dataSource respondsToSelector:@selector(asNavigationBarTitleView:)] && [self.dataSource asNavigationBarTitleView:self]) {
        return;
    }
    
    /**头部标题*/
    UILabel *navTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.as_width * 0.4, 44)];
    
    navTitleLabel.numberOfLines=0;//可能出现多行的标题
    [navTitleLabel setAttributedText:title];
    navTitleLabel.textAlignment = NSTextAlignmentCenter;
    navTitleLabel.backgroundColor = [UIColor clearColor];
    navTitleLabel.userInteractionEnabled = YES;
    navTitleLabel.lineBreakMode = NSLineBreakByClipping;
    
    self.titleView = navTitleLabel;
}


- (void)setLeftView:(UIView *)leftView
{
    [_leftView removeFromSuperview];
    
    [self addSubview:leftView];
    
    _leftView = leftView;
    
    
    if ([leftView isKindOfClass:[UIButton class]]) {
        
        UIButton *btn = (UIButton *)leftView;
        
        [btn addTarget:self action:@selector(leftBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self layoutIfNeeded];
    
}


- (void)setBackgroundImage:(UIImage *)backgroundImage
{
    _backgroundImage = backgroundImage;
    
    self.layer.contents = (id)backgroundImage.CGImage;
}



- (void)setRightView:(UIView *)rightView
{
    [_rightView removeFromSuperview];
    
    [self addSubview:rightView];
    
    _rightView = rightView;
    
    if ([rightView isKindOfClass:[UIButton class]]) {
        
        UIButton *btn = (UIButton *)rightView;
        
        [btn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self layoutIfNeeded];
}



- (void)setDataSource:(id<ASNavigationBarDataSource>)dataSource
{
    _dataSource = dataSource;
    
    [self setupDataSourceUI];
}


#pragma mark - getter

- (UIView *)bottomBlackLineView
{
    if(!_bottomBlackLineView)
    {
        CGFloat height = 0.5;
        UIView *bottomBlackLineView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height , self.frame.size.width, height)];
        [self addSubview:bottomBlackLineView];
        _bottomBlackLineView = bottomBlackLineView;
        bottomBlackLineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _bottomBlackLineView;
}

#pragma mark - event

- (void)leftBtnClick:(UIButton *)btn
{
    if ([self.asDelegate respondsToSelector:@selector(leftButtonEvent:navigationBar:)]) {
        
        [self.asDelegate leftButtonEvent:btn navigationBar:self];
        
    }
    
}


- (void)rightBtnClick:(UIButton *)btn
{
    if ([self.asDelegate respondsToSelector:@selector(rightButtonEvent:navigationBar:)]) {
        
        [self.asDelegate rightButtonEvent:btn navigationBar:self];
        
    }
    
}


-(void)titleClick:(UIGestureRecognizer*)Tap
{
    UILabel *view = (UILabel *)Tap.view;
    if ([self.asDelegate respondsToSelector:@selector(titleClickEvent:navigationBar:)]) {
        
        [self.asDelegate titleClickEvent:view navigationBar:self];
        
    }
}



#pragma mark - custom

- (void)setupDataSourceUI
{
    
    /** 导航条的高度 */
    
    if ([self.dataSource respondsToSelector:@selector(asNavigationHeight:)]) {
        
        self.as_size = CGSizeMake(kScreenWidth, [self.dataSource asNavigationHeight:self]);
        
    }else
    {
        self.as_size = CGSizeMake(kScreenWidth, kDefaultNavBarHeight);
    }
    
    /** 是否显示底部黑线 */
        if ([self.dataSource respondsToSelector:@selector(asNavigationIsHideBottomLine:)]) {
    
            if ([self.dataSource asNavigationIsHideBottomLine:self]) {
                self.bottomBlackLineView.hidden = YES;
            }
    
        }
    
    /** 背景图片 */
    if ([self.dataSource respondsToSelector:@selector(asNavigationBarBackgroundImage:)]) {
        
        self.backgroundImage = [self.dataSource asNavigationBarBackgroundImage:self];
    }
    
    /** 背景色 */
    if ([self.dataSource respondsToSelector:@selector(asNavigationBackgroundColor:)]) {
        self.backgroundColor = [self.dataSource asNavigationBackgroundColor:self];
    }
    
    
    /** 导航条中间的 View */
    if ([self.dataSource respondsToSelector:@selector(asNavigationBarTitleView:)]) {
        
        self.titleView = [self.dataSource asNavigationBarTitleView:self];
        
    }else if ([self.dataSource respondsToSelector:@selector(asNavigationBarTitle:)])
    {
        /**头部标题*/
        self.title = [self.dataSource asNavigationBarTitle:self];
    }
    
    
    /** 导航条的左边的 view */
    /** 导航条左边的按钮 */
    if ([self.dataSource respondsToSelector:@selector(asNavigationBarLeftView:)]) {
        
        self.leftView = [self.dataSource asNavigationBarLeftView:self];
        
    }else if ([self.dataSource respondsToSelector:@selector(asNavigationBarLeftButtonImage:navigationBar:)])
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kSmallTouchSizeHeight, kSmallTouchSizeHeight)];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        
        UIImage *image = [self.dataSource asNavigationBarLeftButtonImage:btn navigationBar:self];
        
        if (image) {
            [btn setImage:image forState:UIControlStateNormal];
        }
        
        self.leftView = btn;
    }
    
    /** 导航条右边的 view */
    /** 导航条右边的按钮 */
    if ([self.dataSource respondsToSelector:@selector(asNavigationBarRightView:)]) {
        
        self.rightView = [self.dataSource asNavigationBarRightView:self];
        
    }else if ([self.dataSource respondsToSelector:@selector(asNavigationBarRightButtonImage:navigationBar:)])
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kLeftRightViewSizeMinWidth, kSmallTouchSizeHeight)];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:16];
        
        UIImage *image = [self.dataSource asNavigationBarRightButtonImage:btn navigationBar:self];
        
        if (image) {
            [btn setImage:image forState:UIControlStateNormal];
        }
        
        self.rightView = btn;
    }
    
}


- (void)setupASNavigationBarUIOnce
{
    self.backgroundColor = [UIColor whiteColor];
}


@end











