//
//  LMJOCJSHelper.h
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/25.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

UIKIT_EXTERN NSString *const LMJOCJSHelperScriptMessageHandlerName1_;


@protocol LMJOCJSHelperDelegate <NSObject>

@optional

@end



@interface LMJOCJSHelper : NSObject<WKScriptMessageHandler>

/** <#digest#> */
@property (weak, nonatomic) WKWebView *webView;

/** <#digest#> */
@property (weak, nonatomic) id<LMJOCJSHelperDelegate> delegate;


- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message;

@end
