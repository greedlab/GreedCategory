//
//  UIView+Greed.h
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Greed)

- (void)gr_setHidden:(BOOL)hidden animated:(BOOL)animated duration:(NSTimeInterval)duration;

/**
 *  隐藏
 *
 *  @param hidden   是否隐藏
 *  @param animated 是否要动画
 */
- (void)gr_setHidden:(BOOL)hidden animated:(BOOL)animated;

@end
