//
//  ASWebViewController.h
//  PLMMPRJK
//
//  Created by Arlen.S on 2017/4/9.
//  Copyright © 2017年 Arlen.S All rights reserved.
//

#import "ASBaseViewController.h"
#import <WebKit/WebKit.h>

@class ASWebViewController;
@protocol ASWebViewControllerDelegate <NSObject>

@optional
// 左上边的返回按钮点击
- (void)backBtnClick:(UIButton *)backBtn webView:(WKWebView *)webView ;

//左上边的关闭按钮的点击
- (void)closeBtnClick:(UIButton *)closeBtn webView:(WKWebView *)webView;

// 监听 self.webView.scrollView 的 contentSize 属性改变，从而对底部添加的自定义 View 进行位置调整
- (void)webView:(WKWebView *)webView scrollView:(UIScrollView *)scrollView contentSize:(CGSize)contentSize;

@end


@protocol ASWebViewControllerDataSource <NSObject>

@optional
// 默认需要, 是否需要进度条
- (BOOL)webViewController:(ASWebViewController *)webViewController webViewIsNeedProgressIndicator:(WKWebView *)webView;

// 默认需要自动改变标题
- (BOOL)webViewController:(ASWebViewController *)webViewController webViewIsNeedAutoTitle:(WKWebView *)webView;

@end

@interface ASWebViewController : ASBaseViewController<WKNavigationDelegate, WKUIDelegate, ASWebViewControllerDelegate, ASWebViewControllerDataSource>

/** webView */
@property (nonatomic, strong) IBOutlet WKWebView *webView;

/** <#digest#> */
@property (nonatomic, copy) NSString *gotoURL;

/** <#digest#> */
@property (nonatomic, copy) NSString *contentHTML;


// 7页面加载完调用, 必须调用super
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation NS_REQUIRES_SUPER;


// 8页面加载失败时调用, 必须调用super
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error NS_REQUIRES_SUPER;

@end
