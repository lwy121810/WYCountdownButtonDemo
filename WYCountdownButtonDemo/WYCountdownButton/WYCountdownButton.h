//
//  WYCountdownButton.h
//
//  Created by lwy1218 on 16/6/20.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYCountdownButton;
typedef void(^TouchUpButtonBlock)(WYCountdownButton *countDownItem);
@interface WYCountdownButton : UIButton

@property (nonatomic , assign , readonly) BOOL isCountdowning;
/** button的标题 （开始时的标题）在故事版中使用的话直接设置normal状态下的标题即可 */
@property (nonatomic , copy)  NSString *title_normal;
/** 计时结束后显示的文字的 默认跟title_normal一样 */
@property (nonatomic , copy) IBInspectable NSString *title_end;
/** button的字体颜色 默认lightGrayColor 在故事版使用的话直接设置按钮的字体颜色即可 */
@property (nonatomic , strong) UIColor *titleNormalColor;
/** 倒计时的总时间 默认60s **/
@property (nonatomic , assign) IBInspectable NSInteger totalSeconds;
/** 倒计时文字显示样式 ‘$’代表秒数 默认‘剩余$秒’ */
@property (nonatomic , copy) IBInspectable NSString *countdownTitleFormatter;


/**
 初始化

 @return self
 */
+ (instancetype)countDown;

/**
 按钮的点击事件回调

 @param itemBlock block
 */
- (void)didTouchUpCountDownButton:(TouchUpButtonBlock)itemBlock;

/**
 开始倒计时
 */
- (void)startCountdown;

/**
 结束倒计时
 */
- (void)stopCountDown;
@end
