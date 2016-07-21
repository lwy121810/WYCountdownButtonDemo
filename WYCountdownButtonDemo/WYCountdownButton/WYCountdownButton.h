//
//  WYCountdownButton.h
//  DaDaImage-iPhone2.0
//
//  Created by lwy1218 on 16/6/20.
//  Copyright © 2016年 lwy1218. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WYCountdownButton;
typedef void(^TouchUpButtonBlock)(WYCountdownButton *countDownItem , NSInteger tag);
@interface WYCountdownButton : UIButton
@property (nonatomic , assign , readonly) BOOL isCountdowning;
/**button的标题**/
@property (nonatomic , copy) NSString *title_normal;
/**计时结束后显示的文字的 默认跟title_normal一样*/
@property (nonatomic , copy) NSString *title_end;
/**button的字体颜色 默认lightGrayColor*/
@property (nonatomic , strong) UIColor *titleColor_normal;
/**倒计时的总时间 默认10s**/
@property (nonatomic , assign) NSInteger totalSeconds;

+ (instancetype)countDown;
//+ (instancetype)countDown;
- (void)didTouchUpCountDownButton:(TouchUpButtonBlock)itemBlock;
//*开始倒计时*
- (void)startCountdown;
/**结束倒计时**/
- (void)stopCountDown;
@end
