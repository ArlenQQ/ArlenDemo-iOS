//
//  ASH5JSBridgeViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/28.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASH5JSBridgeViewController.h"
#import "WKWebViewJsBridge.h"

@interface ASH5JSBridgeViewController ()

@property (nonatomic, strong) WKWebViewJsBridge *jsBridge;

@end

@implementation ASH5JSBridgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ASH5JSBridgeViewController" ofType:@"html"];
    NSURL *fileUrl = [NSURL fileURLWithPath:path];
    NSString *srcPath = [[NSBundle mainBundle] pathForResource:@"H5Bridge" ofType:@"js"];
    NSURL *srcUrl = [NSURL fileURLWithPath:srcPath.pathComponents.firstObject];
    [self.webView loadFileURL:fileUrl allowingReadAccessToURL:srcUrl];
    [self initLocalData];
    
    @WeakObj(self);
    [self.jsBridge registerHandler:@"alertToast" handle:^(id data, void (^responseCallBack)(id responseData)) {
        @StrongObj(self);
        [self.view makeToast:data duration:2 position:CSToastPositionCenter];
    }];

    
    self.webView.as_height = self.view.as_height *0.7;
    self.view.backgroundColor = kColorName(kCX_THEME);
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.as_height * 0.8, kScreenWidth, 44)];
    [btn setTitle:@"oc 调用 js 注册的方法" forState:(UIControlStateNormal)];
    [btn setBackgroundColor:kColorName(kC19_71E46B)];
    [btn setTitleColor:kColorName(kC17_FE3950) forState:(UIControlStateNormal)];
    [btn addTarget:self action:@selector(ocActiveJs) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
}


-(void)dealloc{
    _jsBridge = nil;
}

#pragma mark privare method

-(void) initLocalData{
    [[NSUserDefaults standardUserDefaults] setObject:@"我是存在偏好设置里边value" forKey:@"sesstionId"];
}
/** oc 调用 js 注册的方法 */
-(void)ocActiveJs{
    [self.webView.scrollView scrollToTop];
    static int i = 0;
     i+=2;
    @WeakObj(self);
    [self.jsBridge callHandler:@"insertContent" data:[NSString stringWithFormat:@"我是oc调用js传给js的内容, 内容: %zd", i] responseCallback:^(id responseData) {
        NSLog(@"%@", responseData);
        @StrongObj(self);
        [self.view makeToast:responseData duration:3 position:CSToastPositionCenter];
    }];
}

#pragma mark getter & setter
-(WKWebViewJsBridge *)jsBridge{
    if (_jsBridge == nil) {
        _jsBridge = [[WKWebViewJsBridge alloc] initWithWebView:self.webView delegate:self];
    }
    return _jsBridge;
}

#pragma mark - ASNavUIBaseViewControllerDataSource

-(UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar{
    return [UIImage imageNamed:@"navigationbar_back_white"];
}

#pragma mark - ASNavUIBaseViewControllerDelegate

-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar{
    [self.navigationController popViewControllerAnimated:true];
    
}

@end
