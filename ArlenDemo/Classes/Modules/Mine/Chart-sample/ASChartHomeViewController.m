//
//  ASChartHomeViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/27.
//  Copyright © 2018年 Arlen.S. All rights reserved.
//

#import "ASChartHomeViewController.h"
#import "ASBaseColumnChartViewController.h"

@interface ASChartHomeViewController ()

@end

@implementation ASChartHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ASWordArrowItem *item00 = [ASWordArrowItem itemWithTitle:@"Column Chart" subTitle:@"柱状图"];
    item00.destVc = [ASBaseColumnChartViewController class];
    ASWordArrowItem *item01 = [ASWordArrowItem itemWithTitle:@"Bar Chart" subTitle:@"条状图"];
    item01.destVc = NSClassFromString(@"ASBaseBarChartViewController");
    ASWordArrowItem *item02 = [ASWordArrowItem itemWithTitle:@"Area Chart" subTitle:@"折线填充图"];
    item02.destVc = NSClassFromString(@"ASBaseAreaChartViewController");
    ASWordArrowItem *item03 = [ASWordArrowItem itemWithTitle:@"Areaspline Chart" subTitle:@"曲线填充图"];
    item03.destVc = NSClassFromString(@"ASBaseAreasplineChartViewController");
    ASWordArrowItem *item04 = [ASWordArrowItem itemWithTitle:@"Line Chart" subTitle:@"折线图"];
    item04.destVc = NSClassFromString(@"ASBaseLineChartViewController");
    ASWordArrowItem *item05 = [ASWordArrowItem itemWithTitle:@"Spline Chart" subTitle:@"曲线图"];
    item05.destVc = NSClassFromString(@"ASBaseSplineViewController");
    ASWordArrowItem *item06 = [ASWordArrowItem itemWithTitle:@"Step Line Chart" subTitle:@"直方折线图"];
    item06.destVc = NSClassFromString(@"ASBaseStepLineChartViewController");
    ASWordArrowItem *item07 = [ASWordArrowItem itemWithTitle:@"Step Area Chart" subTitle:@"直方折线填充图"];
    item07.destVc = NSClassFromString(@"ASBaseStepAreaChartViewController");
    ASWordArrowItem *item08 = [ASWordArrowItem itemWithTitle:@"Scatetr Chart" subTitle:@"散点图"];
    item08.destVc = NSClassFromString(@"ASBaseScatterChartViewController");
    ASItemSection * section0 = [ASItemSection sectionWithItems:@[item00,item01,item02,item03,item04,item05,item06,item07,item08] andHeaderTitle:@"Basic Type---基础类型" footerTitle:nil];
    [self.sections addObject:section0];
    
    ASWordArrowItem *item10 = [ASWordArrowItem itemWithTitle:@"Colorful Column Chart" subTitle:@"多彩柱形图"];
    item10.destVc = NSClassFromString(@"");
    ASWordArrowItem *item11 = [ASWordArrowItem itemWithTitle:@"Gradient Color Bar" subTitle:@"颜色渐变条形图"];
    item11.destVc = NSClassFromString(@"");
    ASWordArrowItem *item12 = [ASWordArrowItem itemWithTitle:@"Mixed Line Chart" subTitle:@"虚实线混合折线图"];
    item12.destVc = NSClassFromString(@"");
    ASWordArrowItem *item13 = [ASWordArrowItem itemWithTitle:@"With Dividing Line" subTitle:@"带有阈值分割线区域图"];
    item13.destVc = NSClassFromString(@"");
    ASWordArrowItem *item14 = [ASWordArrowItem itemWithTitle:@"Area Chart with minus" subTitle:@"带有负数的区域填充图"];
    item14.destVc = NSClassFromString(@"");
    ASWordArrowItem *item15 = [ASWordArrowItem itemWithTitle:@"Pie Chart" subTitle:@"扇形图"];
    item15.destVc = NSClassFromString(@"");
    ASWordArrowItem *item16 = [ASWordArrowItem itemWithTitle:@"Bubble Chart" subTitle:@"气泡图"];
    item16.destVc = NSClassFromString(@"");
    ASWordArrowItem *item17 = [ASWordArrowItem itemWithTitle:@"Scatter Chart" subTitle:@"散点图"];
    item17.destVc = NSClassFromString(@"");
    ASWordArrowItem *item18 = [ASWordArrowItem itemWithTitle:@"Arearange Chart" subTitle:@"区域面积图"];
    item18.destVc = NSClassFromString(@"");
    ASWordArrowItem *item19 = [ASWordArrowItem itemWithTitle:@"Area Spline range Chart" subTitle:@"曲线区域面积图"];
    item19.destVc = NSClassFromString(@"");
    ASWordArrowItem *item110 = [ASWordArrowItem itemWithTitle:@"Column Range Chart" subTitle:@"柱形范围图"];
    item110.destVc = NSClassFromString(@"");
    ASWordArrowItem *item111 = [ASWordArrowItem itemWithTitle:@"Step Line Chart" subTitle:@"直方折线图"];
    item111.destVc = NSClassFromString(@"");
    ASWordArrowItem *item112 = [ASWordArrowItem itemWithTitle:@"Step Area Chart" subTitle:@"直方折线填充图"];
    item112.destVc = NSClassFromString(@"");
    ASWordArrowItem *item113 = [ASWordArrowItem itemWithTitle:@"Nightingale Rose Chart" subTitle:@"南丁格尔玫瑰图"];
    item113.destVc = NSClassFromString(@"");
    ASWordArrowItem *item114 = [ASWordArrowItem itemWithTitle:@"Water Fall" subTitle:@"瀑布图"];
    item114.destVc = NSClassFromString(@"");
    ASWordArrowItem *item115 = [ASWordArrowItem itemWithTitle:@"Pyramid Chart" subTitle:@"多彩柱形图"];
    item115.destVc = NSClassFromString(@"");
    ASWordArrowItem *item116 = [ASWordArrowItem itemWithTitle:@"Colorful Column Chart" subTitle:@"金字塔图"];
    item116.destVc = NSClassFromString(@"");
    ASWordArrowItem *item117 = [ASWordArrowItem itemWithTitle:@"Funnel Chart" subTitle:@"漏斗图"];
    item117.destVc = NSClassFromString(@"");
    ASItemSection * section1 = [ASItemSection sectionWithItems:@[item10,item11,item12,item13,item14,item15,item16,item17,item18,item19,item110,item111,item112,item113,item114,item115,item116,item117] andHeaderTitle:@"Special Type---特殊类型" footerTitle:nil];
    [self.sections addObject:section1];
    
    ASWordArrowItem *item20 = [ASWordArrowItem itemWithTitle:@"Arearange Mixed Line" subTitle:@"面积范围均线图"];
    item20.destVc = NSClassFromString(@"");
    ASWordArrowItem *item21 = [ASWordArrowItem itemWithTitle:@"Columnrange Mixed Line" subTitle:@"柱形范围图混合折线图"];
    item21.destVc = NSClassFromString(@"");
    ASWordArrowItem *item22 = [ASWordArrowItem itemWithTitle:@"Stacking Column Mixed Line" subTitle:@"堆积柱形图混合"];
    item22.destVc = NSClassFromString(@"");
    ASWordArrowItem *item23 = [ASWordArrowItem itemWithTitle:@"Dash Style Types Mixed" subTitle:@"多种类型曲线混合图"];
    item23.destVc = NSClassFromString(@"");
    ASWordArrowItem *item24 = [ASWordArrowItem itemWithTitle:@"Negative Color Mixed" subTitle:@"基准线以下异色混合图"];
    item24.destVc = NSClassFromString(@"");
    ASWordArrowItem *item25 = [ASWordArrowItem itemWithTitle:@"Scatter Mixed Line" subTitle:@"散点图混合折线图"];
    item25.destVc = NSClassFromString(@"");
    ASWordArrowItem *item26 = [ASWordArrowItem itemWithTitle:@"Negative Color Mixed bubble" subTitle:@"基准线以下异色"];
    item26.destVc = NSClassFromString(@"");
    ASWordArrowItem *item27 = [ASWordArrowItem itemWithTitle:@"Polygon Mixed Scatter" subTitle:@"多边形混合散点图"];
    item27.destVc = NSClassFromString(@"");
    ASWordArrowItem *item28 = [ASWordArrowItem itemWithTitle:@"Polar Chart Mixed" subTitle:@"极地混合图"];
    item28.destVc = NSClassFromString(@"");
    ASItemSection * section2 = [ASItemSection sectionWithItems:@[item20,item21,item22,item23,item24,item25,item26,item27,item28] andHeaderTitle:@"Mixed Type Chart---混合图表" footerTitle:nil];
    [self.sections addObject:section2];
    
    ASWordArrowItem *item30 = [ASWordArrowItem itemWithTitle:@"Column Chart" subTitle:@"柱形图"];
    item30.destVc = NSClassFromString(@"");
    ASWordArrowItem *item31 = [ASWordArrowItem itemWithTitle:@"Bar Chart" subTitle:@"条形图"];
    item31.destVc = NSClassFromString(@"");
    ASWordArrowItem *item32 = [ASWordArrowItem itemWithTitle:@"Area Chart" subTitle:@"折线填充图"];
    item32.destVc = NSClassFromString(@"");
    ASWordArrowItem *item33 = [ASWordArrowItem itemWithTitle:@"Areaspline Chart" subTitle:@"曲线填充图"];
    item33.destVc = NSClassFromString(@"");
    ASWordArrowItem *item34 = [ASWordArrowItem itemWithTitle:@"Line Chart" subTitle:@"折线图"];
    item34.destVc = NSClassFromString(@"");
    ASWordArrowItem *item35 = [ASWordArrowItem itemWithTitle:@"Spline Chart" subTitle:@"曲线图"];
    item35.destVc = NSClassFromString(@"");
    ASWordArrowItem *item36 = [ASWordArrowItem itemWithTitle:@"Step Line Chart" subTitle:@"直方折线图"];
    item36.destVc = NSClassFromString(@"");
    ASWordArrowItem *item37 = [ASWordArrowItem itemWithTitle:@"Step Area Chart" subTitle:@"直方折线填充图"];
    item37.destVc = NSClassFromString(@"");
    ASWordArrowItem *item38 = [ASWordArrowItem itemWithTitle:@"Scatter Chart" subTitle:@"散点图"];
    item38.destVc = NSClassFromString(@"");
    ASItemSection * section3 = [ASItemSection sectionWithItems:@[item30,item31,item32,item33,item34,item35,item36,item37,item38] andHeaderTitle:@"Real-time Refresh---即时刷新" footerTitle:nil];
    [self.sections addObject:section3];
    
    ASWordArrowItem *item40 = [ASWordArrowItem itemWithTitle:@"Column Chart" subTitle:@"柱形图"];
    item40.destVc = NSClassFromString(@"");
    ASWordArrowItem *item41 = [ASWordArrowItem itemWithTitle:@"Bar Chart" subTitle:@"条形图"];
    item41.destVc = NSClassFromString(@"");
    ASWordArrowItem *item42 = [ASWordArrowItem itemWithTitle:@"Area Chart" subTitle:@"折线填充图"];
    item42.destVc = NSClassFromString(@"");
    ASWordArrowItem *item43 = [ASWordArrowItem itemWithTitle:@"Areaspline Chart" subTitle:@"曲线填充图"];
    item43.destVc = NSClassFromString(@"");
    ASWordArrowItem *item44 = [ASWordArrowItem itemWithTitle:@"Line Chart" subTitle:@"折线图"];
    item44.destVc = NSClassFromString(@"");
    ASWordArrowItem *item45 = [ASWordArrowItem itemWithTitle:@"Spline Chart" subTitle:@"曲线图"];
    item45.destVc = NSClassFromString(@"");
    ASWordArrowItem *item46 = [ASWordArrowItem itemWithTitle:@"Step Line Chart" subTitle:@"直方折线图"];
    item46.destVc = NSClassFromString(@"");
    ASWordArrowItem *item47 = [ASWordArrowItem itemWithTitle:@"Step Area Chart" subTitle:@"直方折线填充图"];
    item47.destVc = NSClassFromString(@"");
    ASItemSection * section4 = [ASItemSection sectionWithItems:@[item40,item41,item42,item43,item44,item45,item46,item47] andHeaderTitle:@"Real-time Refresh---即时刷新" footerTitle:nil];
    [self.sections addObject:section4];
    
    ASWordArrowItem *item50 = [ASWordArrowItem itemWithTitle:@"绘制Legent居顶部的区域填充图" subTitle:@""];
    item50.destVc = NSClassFromString(@"");
    ASWordArrowItem *item51 = [ASWordArrowItem itemWithTitle:@"绘制带有中心标题的环形图" subTitle:@""];
    item51.destVc = NSClassFromString(@"");
    ASWordArrowItem *item52 = [ASWordArrowItem itemWithTitle:@"绘制嵌套的柱形图" subTitle:@""];
    item52.destVc = NSClassFromString(@"");
    ASWordArrowItem *item53 = [ASWordArrowItem itemWithTitle:@"多边形线框的雷达图" subTitle:@""];
    item53.destVc = NSClassFromString(@"");
    ASWordArrowItem *item54 = [ASWordArrowItem itemWithTitle:@"Custom style tooltip" subTitle:@"自定义浮动提示框"];
    item54.destVc = NSClassFromString(@"");
    ASWordArrowItem *item55 = [ASWordArrowItem itemWithTitle:@"调整图标的左右边距" subTitle:@""];
    item55.destVc = NSClassFromString(@"");
    ASWordArrowItem *item56 = [ASWordArrowItem itemWithTitle:@"设置图表绘图区的背景图片" subTitle:@""];
    item56.destVc = NSClassFromString(@"");
    ASWordArrowItem *item57 = [ASWordArrowItem itemWithTitle:@"Double Y Axises Chart" subTitle:@"双Y轴混合图"];
    item57.destVc = NSClassFromString(@"");
    ASWordArrowItem *item58 = [ASWordArrowItem itemWithTitle:@"Adjust Data Accuracy" subTitle:@"调整数据精度"];
    item58.destVc = NSClassFromString(@"");
    ASWordArrowItem *item59 = [ASWordArrowItem itemWithTitle:@"Adjust Group Padding" subTitle:@"调整Group间距"];
    item59.destVc = NSClassFromString(@"");
    ASItemSection * section5 = [ASItemSection sectionWithItems:@[item50,item51,item52,item53,item54,item55,item56,item57,item58,item59] andHeaderTitle:@"AAOptions---Use AAOptions" footerTitle:nil];
    [self.sections addObject:section5];
    
    ASWordArrowItem *item60 = [ASWordArrowItem itemWithTitle:@"同时显示多个AAChartView" subTitle:@""];
    item60.destVc = NSClassFromString(@"");
    ASWordArrowItem *item61 = [ASWordArrowItem itemWithTitle:@"UITableView上显示多个AAChartView" subTitle:@""];
    item61.destVc = NSClassFromString(@"");

    ASItemSection * section6 = [ASItemSection sectionWithItems:@[item60,item61] andHeaderTitle:@"同时显示多个 AAChartView" footerTitle:nil];
    [self.sections addObject:section6];
    
    ASWordArrowItem *item70 = [ASWordArrowItem itemWithTitle:@"Drilldown Column Chart" subTitle:@"向下钻取的柱状图"];
    item70.destVc = NSClassFromString(@"");

    
    ASItemSection * section7 = [ASItemSection sectionWithItems:@[item60,item61] andHeaderTitle:@"Drilldown Chart-- 钻取图表(暂时废弃)" footerTitle:nil];
    [self.sections addObject:section7];
    
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
