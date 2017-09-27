//
//  TestViewController.m
//  WYCountdownButtonDemo
//
//  Created by lwy1218 on 2017/8/17.
//  Copyright © 2017年 lwy1218. All rights reserved.
//

#import "TestViewController.h"
#import "WYCountdownButton.h"

@interface TestViewController ()
@property (weak, nonatomic) IBOutlet WYCountdownButton *countButton;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.countButton.title_normal = @"点击开始倒计时";
    self.countButton.countdownTitleFormatter = @"还剩$秒";
    self.countButton.titleNormalColor = [UIColor redColor];
    __weak typeof(self)weakSelf = self;
    [self.countButton didTouchUpCountDownButton:^(WYCountdownButton *countDownItem) {
        [weakSelf.countButton startCountdown];
    }];
    
    
    WYCountdownButton *countdownButton = [WYCountdownButton countDown];
    countdownButton.frame = CGRectMake(80, 80, 100, 35);
    countdownButton.backgroundColor = [UIColor brownColor];
    /**设置开始时的文字*/
    countdownButton.title_normal = @"获取验证码";
    [self.view addSubview:countdownButton];
    /**设置结束后的文字*/
    countdownButton.title_end = @"重新获取";
    
    [countdownButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    /**点击按钮之后*/
//    [countdownButton didTouchUpCountDownButton:^(WYCountdownButton *countDownItem) {
//        /**开始计时*/
//        [countDownItem startCountdown];
//    }];
    
}
- (void)buttonAction:(WYCountdownButton *)sender
{
    [sender startCountdown];
}
- (void)dealloc
{
    NSLog(@"dealloc ---- ");
}

@end
