//
//  ViewController.m
//  WYCountdownButtonDemo
//
//  Created by lwy1218 on 16/7/21.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import "ViewController.h"
#import "WYCountdownButton.h"
#import "TestViewController.h"
@interface ViewController ()
{
    WYCountdownButton *_countdownButton;
}

@end

@implementation ViewController
- (IBAction)push:(id)sender {
    TestViewController *vc = [[TestViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
// xib生成的按钮 所有属性均在xib里设置 注意buttontype选择custom
- (IBAction)clickMe:(WYCountdownButton *)sender {
    [sender startCountdown];
    NSLog(@">>>>>>>>>>>> %@ %@", sender.title_normal, sender.title_end);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupView];
}
- (void)setupView
{
    
    /**初始化*/
    //使用这种初始化的时候要注意类型为UIButtonTypeCustom
    //WYCountdownButton *countdownButton = [WYCountdownButton buttonWithType:UIButtonTypeCustom];
    WYCountdownButton *countdownButton = [WYCountdownButton countDown];
    countdownButton.frame = CGRectMake(80, 80, 100, 35);
    countdownButton.backgroundColor = [UIColor redColor];
    /**设置开始时的文字*/
    countdownButton.title_normal = @"获取验证码";
    [self.view addSubview:countdownButton];
    /**设置结束后的文字*/
    countdownButton.title_end = @"重新获取";
    /**点击按钮之后*/
    [countdownButton didTouchUpCountDownButton:^(WYCountdownButton *countDownItem) {
        /**开始计时*/
        [countdownButton startCountdown];
    }];
    _countdownButton = countdownButton;
}
- (IBAction)stop:(id)sender {
    /**结束计时*/
    [_countdownButton stopCountDown];
}
- (void)countdown:(WYCountdownButton *)sender
{
    [sender startCountdown];
}
- (IBAction)start:(id)sender {
    
    [_countdownButton startCountdown];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
