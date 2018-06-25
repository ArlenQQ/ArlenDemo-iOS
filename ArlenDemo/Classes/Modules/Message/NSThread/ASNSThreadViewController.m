//
//  ASNSThreadViewController.m
//  ArlenDemo
//
//  Created by 乐居Mac on 2018/6/25.
//  Copyright © 2018年 乐居Mac. All rights reserved.
//

#import "ASNSThreadViewController.h"
#import "ASSettingCell.h"
#import <pthread.h>

@interface ASNSThreadViewController ()
@property (nonatomic, strong) NSThread *myThread;

@property (nonatomic, strong) NSMutableArray *myThreadList;
@end

@implementation ASNSThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    @WeakObj(self);
    self.addItem([ASWordItem itemWithTitle:@"pthread" subTitle:@"pthread_create" itemOperation:^(NSIndexPath *indexPath) {
        [selfWeak addPthread];
    }])
    .addItem([ASWordItem itemWithTitle:@"简单创建一个多线程" subTitle:@"NSThread alloc init" itemOperation:^(NSIndexPath *indexPath) {
        [selfWeak addThreadAction];
    }])
    .addItem([ASWordItem itemWithTitle:@"测试增加一定数量对CPU的影响" subTitle:@"在子线程中创建多个线程 不影响主线程" itemOperation:^(NSIndexPath *indexPath) {
        NSLog(@"%lf", CFAbsoluteTimeGetCurrent());
        [selfWeak addMutableThread];
        NSLog(@"%lf", CFAbsoluteTimeGetCurrent());
    }])
    .addItem([ASWordItem itemWithTitle:@"强制退出线程" subTitle:@"[NSThread exit]" itemOperation:^(NSIndexPath *indexPath) {
        [selfWeak exitThread];
    }])
    .addItem([ASWordItem itemWithTitle:@"用一个数组存储多条线程" subTitle:@"" itemOperation:^(NSIndexPath *indexPath) {
        [selfWeak addArrayThtead];
    }]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark private method

void *run(void *param) {
    
    for (NSInteger i = 0; i<100; i++) {
        NSLog(@"------pthread_t---%zd--%@", i, [NSThread currentThread]);
    }
    return NULL;
}

- (void)runAction:(id)obj
{
    NSLog(@"当前执行的线程为：%@", [NSThread currentThread]);
}

-(void)runMutableThreadAction
{
    for (int num=0; num < 100; num++) {
        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(runMutableAction) object:nil];
        thread.name=[NSString stringWithFormat:@"thread-thread"];
        [thread start];
    }
    NSLog(@"%@", [NSThread currentThread]);
}
-(void)runMutableAction
{
    NSLog(@"当前线程为：%@",[NSThread currentThread]);
}

-(void)runExitAction
{
    //阻塞（暂停）3秒后执行再下面内容
    [NSThread sleepForTimeInterval:3]; //单位是秒
    [[NSThread currentThread] cancel];
    //结合下面的cancel运用 进行强制退出线程的操作
    if ([[NSThread currentThread] isCancelled]) {
        NSLog(@"当前thread-exit被exit动作了");
        [NSThread exit];
    }
    NSLog(@"当前thread-exit线程为：%@",[NSThread currentThread]);
}

-(void)loadAction:(NSNumber *)index
{
    NSThread *thread=[NSThread currentThread];
    NSLog(@"loadAction是在线程%@中执行",thread.name);
    
    //回主线程去执行  有些UI相应 必须在主线程中更新
    //    [self.imageView performSelector:@selector(setImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:NO];
    //    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
    //    [self performSelectorOnMainThread:@selector(showImage:) withObject:image waitUntilDone:YES];
    [self performSelectorOnMainThread:@selector(updateImage) withObject:nil waitUntilDone:YES];
}

-(void)updateImage
{
    NSLog(@"执行完成了");
    NSLog(@"执行方法updateImage是在===%@线程===中",[NSThread isMainThread] ? @"主" : @"子");
}


// 0: pthread
-(void)addPthread {
    pthread_t thread;
    pthread_create(&thread, NULL, run, NULL);
    pthread_t thread2;
    pthread_create(&thread2, NULL, run, NULL);
}
//一：简单创建一个多线程
-(void)addThreadAction{
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(runAction:) object:nil];
    thread.name = @"custom--1";
    [thread start];
    
    //另外的创建方式
    //1：创建线程后自动启动线程 [NSThread detachNewThreadSelector:@selector(runAction:) toTarget:self withObject:@"rose"];
    //2：隐式创建并启动线程 [self performSelectorInBackground:@selector(runAction:) withObject:@"jack"];
}
//二：测试增加一定数量对CPU的影响
-(void)addMutableThread{
    //把创建子线程的操作放在一个子线程中进行 不影响主线程
    NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(runMutableThreadAction) object:nil];
    thread.name=[NSString stringWithFormat:@"thread-mutable"];
    [thread start];
}

-(void)exitThread{
    _myThread = nil;
    if (!self.myThread) {
        self.myThread=[[NSThread alloc]initWithTarget:self selector:@selector(runExitAction) object:nil];
        self.myThread.name=@"thread-exit";
    }
    [self.myThread start];
}

-(void)addArrayThtead{
    if (!self.myThreadList) {
        self.myThreadList=[[NSMutableArray alloc]init];
    }
    
    [self.myThreadList removeAllObjects];
    
    for(int i=0; i<10;i++)
    {
        NSThread *thread=[[NSThread alloc]initWithTarget:self selector:@selector(loadAction:) object:[NSNumber numberWithInt:i]];
        thread.name=[NSString stringWithFormat:@"myThread%i",i];
        [self.myThreadList addObject:thread];
    }
    
    for (int i=0; i<self.myThreadList.count; i++) {
        NSThread *thread=self.myThreadList[i];
        [thread start];
    }
}

#pragma mark UITableViewDelegate
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASWordItem *item = self.sections[indexPath.section].items[indexPath.row];
    
    ASSettingCell *cell = [ASSettingCell cellWithTableView:tableView andCellStyle:UITableViewCellStyleSubtitle];
    
    cell.item = item;
    return cell;
}

#pragma mark - ASNavUIBaseViewControllerDataSource

-(UIImage *)asNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(ASNavigationBar *)navigationBar{
    return [UIImage imageNamed:@"navigationbar_back_white"];
}

#pragma mark - ASNavUIBaseViewControllerDelegate

-(void)leftButtonEvent:(UIButton *)sender navigationBar:(ASNavigationBar *)navigationBar{
    [self.navigationController popViewControllerAnimated:true];
    
}

- (void)dealloc {
    
    //退出页面时就把线程标识为cancel
    if (![self.myThread isCancelled]) {
        NSLog(@"当前thread-exit线程被cancel");
        [self.myThread cancel];
        NSLog(@"当前thread-exit线程被cancel的状态 %@",[self.myThread isCancelled]?@"被标识为Cancel":@"没有被标识");
    }
    
    //结合VC生命周期退出页面时就把线程标识为cancel 使用Thread一定要在退出前进行退出，否则会有闪存泄露的问题
    for (int i=0; i<self.myThreadList.count; i++){
        NSThread *thread=self.myThreadList[i];
        if (![thread isCancelled]) {
            NSLog(@"当前thread-exit线程被cancel");
            //cancel 只是一个标识 最下退出强制终止线程的操作是exit 如果单写cancel 线程还是会继续执行
            [thread cancel];
        }}
}

@end
