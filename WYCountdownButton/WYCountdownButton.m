//
//  WYCountdownButton.m
//  DaDaImage-iPhone2.0
//
//  Created by lwy1218 on 16/6/20.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import "WYCountdownButton.h"


@interface WYCountdownButton ()
{
    NSTimer *_timer;
    NSInteger _second;
}
@property (nonatomic , copy) TouchUpButtonBlock itemBlock;
@end
@implementation WYCountdownButton

+ (instancetype)countDown
{
    WYCountdownButton *button = [WYCountdownButton buttonWithType:UIButtonTypeCustom];
    button.titleColor_normal = [UIColor lightGrayColor];
    button.totalSeconds = 10;//默认时间
    return button;
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

- (void)startCountdown:(NSTimer *)timer
{
    _second--;
    if (_second < 0) {
        [self stopCountDown];
        return;
    }
    _isCountdowning = YES;
    self.enabled = NO;
    NSString *title = [NSString stringWithFormat:@"%zd秒",_second];
    [self setTitle:title forState:UIControlStateNormal];
    [self setTitle:title forState:UIControlStateDisabled];
}
- (void)setTitle_end:(NSString *)title_end
{
    _title_end = title_end;
    
}
- (void)setTotalSeconds:(NSInteger)totalSeconds
{
    _totalSeconds = totalSeconds;
    _second = totalSeconds;
}
- (void)setTitle_normal:(NSString *)title_normal
{
    _title_normal = title_normal;
    self.title_end = title_normal;
    [self setTitle:title_normal forState:UIControlStateNormal];
}
- (void)setTitleColor_normal:(UIColor *)titleColor_normal
{
    _titleColor_normal = titleColor_normal;
    [self setTitleColor:titleColor_normal forState:UIControlStateNormal];
}
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
- (void)didTouchUpCountDownButton:(TouchUpButtonBlock)itemBlock
{
    self.itemBlock = itemBlock;
     [self addTarget:self action:@selector(touched:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)touched:(WYCountdownButton *)sender
{
    if (self.itemBlock) {
        self.itemBlock(sender ,sender.tag);
    }
}

@end
