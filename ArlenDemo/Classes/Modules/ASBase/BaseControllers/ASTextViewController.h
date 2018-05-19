//
//  ASTextViewController.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/26.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASNavUIBaseViewController.h"
#import "ASNavUIBaseViewController.h"

@class ASTextViewController;
@protocol ASTextViewControllerDataSource <NSObject>

@optional
- (UIReturnKeyType)textViewControllerLastReturnKeyType:(ASTextViewController *)textViewController;

- (BOOL)textViewControllerEnableAutoToolbar:(ASTextViewController *)textViewController;

//  控制是否可以点击点击的按钮
- (NSArray <UIButton *> *)textViewControllerRelationButtons:(ASTextViewController *)textViewController;

@end


@protocol ASTextViewControllerDelegate <UITextViewDelegate, UITextFieldDelegate>

@optional
#pragma mark - 最后一个输入框点击键盘上的完成按钮时调用
- (void)textViewController:(ASTextViewController *)textViewController inputViewDone:(id)inputView;
@end

@interface ASTextViewController : ASNavUIBaseViewController<ASTextViewControllerDataSource, ASTextViewControllerDelegate>

- (BOOL)textFieldShouldClear:(UITextField *)textField NS_REQUIRES_SUPER;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string NS_REQUIRES_SUPER;
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text NS_REQUIRES_SUPER;
- (BOOL)textFieldShouldReturn:(UITextField *)textField NS_REQUIRES_SUPER;


@end




#pragma mark - design UITextField
IB_DESIGNABLE
@interface UITextField (ASTextViewController)

@property (assign, nonatomic) IBInspectable BOOL isEmptyAutoEnable;

@end


@interface ASTextViewControllerTextField : UITextField

@end





