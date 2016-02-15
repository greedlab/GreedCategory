//
//  UIView+Greed.m
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "UIView+Greed.h"

@implementation UIView (Greed)

- (void)gr_setHidden:(BOOL)hidden animated:(BOOL)animated duration:(NSTimeInterval)duration
{
    if (self.hidden == hidden) {
        return;
    }
    if (animated) {
        if (!hidden) {
            [self setHidden:hidden];
        }
        self.alpha = hidden ? 1 : 0;
        [UIView animateWithDuration:duration animations:^{
            self.alpha = hidden ? 0 : 1;
        } completion:^(BOOL finished) {
            if (hidden) {
                [self setHidden:hidden];
            }
        }];
    } else {
        [self setHidden:hidden];
    }
}

- (void)gr_setHidden:(BOOL)hidden animated:(BOOL)animated
{
    [self gr_setHidden:hidden animated:animated duration:0.2];
}

@end
