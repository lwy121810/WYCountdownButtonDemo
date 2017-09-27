//
//  WYCountdownButton.m
//  DaDaImage-iPhone2.0
//
//  Created by lwy1218 on 16/6/20.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import "WYCountdownButton.h"
IB_DESIGNABLE
@interface WYCountdownButton ()
{
    NSInteger _second;
}
@property (nonatomic , copy) TouchUpButtonBlock itemBlock;
@property (nonatomic , weak) NSTimer *timer;
@end
@implementation WYCountdownButton

+ (instancetype)countDown
{
    WYCountdownButton *button = [WYCountdownButton buttonWithType:UIButtonTypeCustom];
    [button setupDefaultValue];
    return button;
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self setupDefaultValue];
}
+ (instancetype)buttonWithType:(UIButtonType)buttonType
{
    WYCountdownButton *button = [super buttonWithType:UIButtonTypeCustom];
    
    [button setupDefaultValue];
    
    return button;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupDefaultValue];
    }
    return self;
}

/**
 设置默认数据
 */
- (void)setupDefaultValue
{
    if (self.titleNormalColor == nil) {
        self.titleNormalColor = [UIColor lightGrayColor];
    }
    if (self.totalSeconds <= 0) {
        self.totalSeconds = 60;//默认时间
    }
    if ([self stringIsBlank:self.countdownTitleFormatter] || ![self.countdownTitleFormatter containsString:@"$"]) {
        self.countdownTitleFormatter = @"剩余$秒";
    }
    if ([self stringIsBlank:self.title_normal]) {
        self.title_normal = @"发送验证码";
    }
    if ([self stringIsBlank:self.title_end]) {
        self.title_end = self.title_normal;
    }
}
- (BOOL)stringIsBlank:(NSString *)string
{
    // 判断字符串是否为空
    if (string == nil || string == NULL) {
        return YES;
    }
    
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        // 去掉前后空格，判断length是否为0
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"null"] || [string isEqualToString:@"<null>"])
    {
        return YES;
    }
    
    return NO;
}

#pragma mark - private
- (void)startCountdown
{
    if ([_timer isValid]) {//timer还有效的话直接返回
        return;
    }
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startCountdown:) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

/**
 开始倒计时

 @param timer 计时器
 */
- (void)startCountdown:(NSTimer *)timer
{
    _second--;
    if (_second < 0) {
        [self stopCountDown];
        return;
    }
    _isCountdowning = YES;
    self.enabled = NO;
    
    NSString *title = [NSString stringWithFormat:@"%zd",_second];
    
    if (_countdownTitleFormatter && [_countdownTitleFormatter containsString:@"$"]) {
        title = [_countdownTitleFormatter stringByReplacingOccurrencesOfString:@"$" withString:title];
    }
    else {
        title = [NSString stringWithFormat:@"%zd秒",_second];
    }
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateDisabled];
    self.titleLabel.adjustsFontSizeToFitWidth = YES;
}

/**
 设置总倒计时时间

 @param totalSeconds 总时间
 */
- (void)setTotalSeconds:(NSInteger)totalSeconds
{
    _totalSeconds = totalSeconds;
    _second = totalSeconds;
}

/**
 设置倒计时之前的标题

 @param title_normal 标题
 */
- (void)setTitle_normal:(NSString *)title_normal
{
    self.title_end = title_normal;
    [self setTitle:title_normal forState:UIControlStateNormal];
}

- (NSString *)title_normal
{
    return [self titleForState:UIControlStateNormal];
}

/**
 设置字体颜色

 @param titleNormalColor 字体颜色
 */
- (void)setTitleNormalColor:(UIColor *)titleNormalColor
{
     [self setTitleColor:titleNormalColor forState:UIControlStateNormal];
}
- (UIColor *)titleNormalColor
{
    return [self titleColorForState:UIControlStateNormal];
}
/**
 结束倒计时
 */
- (void)stopCountDown
{
    if (_timer) {
        if ([_timer isValid]) {
            [_timer invalidate];
            _second =_totalSeconds;
            _isCountdowning = NO;
            self.enabled = YES;
            _timer = nil;
            [self setTitle:self.title_end forState:UIControlStateNormal];
        }
    }
}
- (void)dealloc
{
    [_timer invalidate];
    _timer = nil;
}

/**
 按钮的点击事件回调

 @param itemBlock block
 */
- (void)didTouchUpCountDownButton:(TouchUpButtonBlock)itemBlock
{

    self.itemBlock = itemBlock;
    [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}

/**
 按钮的点击事件

 @param sender sender
 */
- (void)touched:(WYCountdownButton *)sender
{
    if (self.itemBlock) {
        self.itemBlock(sender);
    }
}

@end
