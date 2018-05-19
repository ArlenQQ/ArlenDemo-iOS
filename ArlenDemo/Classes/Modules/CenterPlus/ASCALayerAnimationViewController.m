//
//  ASCALayerAnimationViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/5/18.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASCALayerAnimationViewController.h"
#import "ASWebViewController.h"
#import "UIView+ASTransform.h"
#import "ASHeartView.h"

NSInteger const heartWidth = 200;
NSInteger const heartHeight = 200;

@interface ASCALayerAnimationViewController ()<ASWebViewControllerDelegate>

@property (nonatomic,strong) dispatch_source_t timer;

@property (nonatomic,strong) ASHeartView *heartView;

@end

@implementation ASCALayerAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:kColorName(kCX_THEME)];
    // Do any additional setup after loading the view.
    [self animationDashLine];
    [self initHeartViewUI];
}


/** 虚线滚动 */
-(void) animationDashLine{
    CAShapeLayer* dashLineShapeLayer = [CAShapeLayer layer];
    //创建贝塞尔曲线
    UIBezierPath* dashLinePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 200, 100) cornerRadius:20];
    
    dashLineShapeLayer.path = dashLinePath.CGPath;
    dashLineShapeLayer.position = CGPointMake(self.view.centerX - 100, 100);
    dashLineShapeLayer.fillColor = [UIColor clearColor].CGColor;
    dashLineShapeLayer.strokeColor = kColorName(kC0_26A6FF).CGColor;
    dashLineShapeLayer.lineWidth = 3;
    dashLineShapeLayer.lineDashPattern = @[@(6),@(6)];
    dashLineShapeLayer.strokeStart = 0;
    dashLineShapeLayer.strokeEnd = 1;
    //dashLineShapeLayer.zPosition = 999;
    //
    [self.view.layer addSublayer:dashLineShapeLayer];
    
    //
    NSTimeInterval delayTime = 0.3f;
    //定时器间隔时间
    NSTimeInterval timeInterval = 0.1f;
    //创建子线程队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //使用之前创建的队列来创建计时器
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    //设置延时执行时间，delayTime为要延时的秒数
    dispatch_time_t startDelayTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayTime * NSEC_PER_SEC));
    //设置计时器
    dispatch_source_set_timer(_timer, startDelayTime, timeInterval * NSEC_PER_SEC, 0.1 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        //执行事件
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            CGFloat _add = 3;
            dashLineShapeLayer.lineDashPhase -= _add;
        });
    });
    // 启动计时器
    dispatch_resume(_timer);
}

/** ❤️型动画View */

-(void) initHeartViewUI{
    _heartView = [[ASHeartView alloc] initWithFrame:CGRectMake((kScreenWidth - heartWidth) * 0.5, 300, heartWidth, heartHeight)];
    _heartView.rate = 0.5;
    _heartView.lineWidth = 2.0f;
    _heartView.backgroundColor = [UIColor clearColor];
    _heartView.userInteractionEnabled = true;
    [self.view addSubview:_heartView];
}

#pragma mark -- ASNavigationBarDataSource  --

-(UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar{
    
    return [UIImage imageNamed:@"navigationbar_back_white"];
}

-(UIImage *)asNavigationBarRightButtonImage:(UIButton *)rightButton navigationBar:(ASNavigationBar *)navigationBar{
    [rightButton setTitle:@"www" forState:UIControlStateNormal];
    [rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightButton sizeToFit];
    rightButton.as_width = 60;
    rightButton.height = 44;
    return nil;
}

#pragma mark -- ASNavigationBarDelegate  --

-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar{
    [self.navigationController popViewControllerAnimated:true];
}

-(void)rightButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar{
    ASWebViewController *ac = [ASWebViewController new];
    ac.gotoURL = @"https://www.jianshu.com/p/98ff8012362a";
    [self.navigationController pushViewController:ac animated:YES];
}

#pragma mark ASWebViewControllerDelegate --


-(void)backBtnClick:(UIButton *)backBtn webView:(WKWebView *)webView{
//    backBtn.backgroundColor = [UIColor whiteColor];
//    [backBtn setImage:[UIImage imageNamed:@"navigationbar_back_white"] forState:(UIControlStateNormal)];
//    backBtn.as_height = 44;
//    backBtn.as_width = 44;
    
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    self.timer = nil;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
   // [self.view ASTransform_circleColor_toColor:kColorRandom Duration:0.25 StartPoint:self.view.center];
   // [self.view ASTransForm_beginZoom_max:2.0 min:0.5];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
