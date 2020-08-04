//
//  LXShareSheetAlert.m
//  TaxReader
//
//  Created by asdc on 2020/8/4.
//  Copyright © 2020 TongFangXL. All rights reserved.
//

#import "LXShareSheetAlert.h"
#import "LEEAlert.h"
#import "ShareView.h"
#import "AllShareView.h"

@implementation LXShareSheetAlert

- (void)showLEEAlertShareSheet {
    AllShareView *view = [[AllShareView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 0)
                                                    ShowMore:NO
                                                  ShowReport:YES];
    view.openShareBlock = ^(ShareType type) {
        NSInteger showType = type;
        if (self.openShareTypeBlock) self.openShareTypeBlock(showType);
    };
    
    // 显示代码可以封装到自定义视图中 例如 [view show];
    [LEEAlert actionsheet].config
    .LeeAddCustomView(^(LEECustomView *custom) {
        custom.view = view;
        custom.isAutoWidth = YES;
    })
    .LeeItemInsets(UIEdgeInsetsMake(0, 0, 0, 0))
    .LeeAddAction(^(LEEAction *action) {
        action.title = @"取消";
        action.titleColor = [UIColor grayColor];
        action.height = 45.0f;
    })
    .LeeHeaderInsets(UIEdgeInsetsMake(0, 0, 0, 0))
    .LeeActionSheetBottomMargin(0.0f)
    .LeeActionSheetBackgroundColor([UIColor whiteColor])
    .LeeCornerRadius(0.0f)
    .LeeConfigMaxWidth(^CGFloat(LEEScreenOrientationType type) {
        // 这是最大宽度为屏幕宽度 (横屏和竖屏)
        return CGRectGetWidth([[UIScreen mainScreen] bounds]);
    })
    .LeeOpenAnimationConfig(^(void (^animatingBlock)(void), void (^animatedBlock)(void)) {
        [UIView animateWithDuration:1.0f delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:1 options:UIViewAnimationOptionAllowUserInteraction animations:^{
            
            animatingBlock(); //调用动画中Block
            
        } completion:^(BOOL finished) {
            
            animatedBlock(); //调用动画结束Block
        }];
        
    })
    #ifdef __IPHONE_13_0
    .LeeUserInterfaceStyle(UIUserInterfaceStyleLight)
    #endif
    .LeeShow();
}

@end
