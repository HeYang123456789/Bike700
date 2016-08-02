//
//  PromptView.m
//  Bike700
//
//  Created by HEYANG on 16/8/2.
//  Copyright © 2016年 HeYang. All rights reserved.
//

#import "PromptView.h"


@interface PromptView ()

@property (nonatomic,weak)UILabel *promptLable;

@end

@implementation PromptView


+ (PromptView*)getPromptView{
    PromptView *promptView = [PromptView new];
    promptView.frame = CGRectMake(0, -64, UIScreenWidth, 64);
    
    UILabel *promptLabel = [UILabel new];
    promptLabel.frame = CGRectMake(20, 20, UIScreenWidth-40, 44);
    promptLabel.font = [UIFont systemFontOfSize:14];
    promptLabel.textAlignment = NSTextAlignmentLeft;
    [promptView addSubview:promptLabel];
    promptView.promptLable = promptLabel;
    
    UIView* lastView = [[UIApplication sharedApplication].windows lastObject];
    [lastView addSubview:promptView];
    
    return promptView;
}

- (void)show:(NSTimeInterval)duration bloc:(void (^)(BOOL finished))bloc{
    [UIView animateWithDuration:duration animations:^{
        self.frame = CGRectMake(0, 0, UIScreenWidth, 64);
    } completion:bloc];
}

- (void)hide{
    
}

+ (void)showError:(NSString*)error{
    PromptView *promptView = [PromptView getPromptView];
    promptView.promptLable.text = error;
    promptView.promptLable.backgroundColor = PromptViewBgColor;
    promptView.backgroundColor = PromptViewBgColor;
    
    [promptView show:0.5 bloc:^(BOOL finished) {
        [UIView animateWithDuration:0.5 delay:2 options:0 animations:^{
            promptView.frame = CGRectMake(0, -64, UIScreenWidth, 64);
        } completion:^(BOOL finished) {
            [promptView removeFromSuperview];
        }];
    }];
}

@end
