# WYCountdownButtonDemo
一个封装的获取验证码倒计时的button
#### 示例
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
    [countdownButton didTouchUpCountDownButton:^(WYCountdownButton *countDownItem, NSInteger tag) {
        /**开始计时*/
        [countdownButton startCountdown];
    }];
  
  ####效果图
  ![image](https://github.com/lwy121810/WYPlaceholderTextView/tree/master/Gif)
