//
//  UIWindow+Greed.m
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "UIWindow+Greed.h"

@implementation UIWindow (Greed)

+ (UIWindow*)gr_keyWindow
{
    UIApplication *application = [UIApplication sharedApplication];
    UIWindow *window = [application keyWindow];
    if (!window) {
        window = [[application windows] firstObject];
    }
    return window;
}

@end
