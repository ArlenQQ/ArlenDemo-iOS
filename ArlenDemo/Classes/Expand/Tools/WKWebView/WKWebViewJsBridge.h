//
//  WKWebViewJsBridge.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/25.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>


@interface WKWebViewJsBridge : NSObject<WKNavigationDelegate>

- (instancetype)initWithWebView:(WKWebView *)webView delegate:(id<WKNavigationDelegate>)delegate;

@property (weak, nonatomic, readonly) WKWebView *webView;

- (void)registerHandler:(NSString *)handleName handle:(void(^)(id data, void(^)(id responseData)))handle;

- (void)callHandler:(NSString*)handlerName data:(id)data responseCallback:(void(^)(id responseData))responseCallback;

@end

