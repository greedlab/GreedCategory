//
//  UITextView+Greed.m
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "UITextView+Greed.h"
#import <objc/runtime.h>

@implementation UITextView (Greed)

#pragma mark - getter and setter

- (void)setGr_canResign:(BOOL)canResign
{
    objc_setAssociatedObject(self, @selector(gr_canResign), [NSNumber numberWithBool:canResign], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)gr_canResign
{
    NSNumber *numCanResign = objc_getAssociatedObject(self, @selector(gr_canResign));
    return numCanResign ? [numCanResign boolValue] : YES;
}

#pragma mark - super

- (BOOL)canResignFirstResponder
{
    return self.gr_canResign;
}

#pragma mark - content height

- (CGFloat)gr_editableContentHeight
{
    CGSize size = [self sizeThatFits:CGSizeMake(self.frame.size.width, FLT_MAX)];
    return size.height;
}

- (CGFloat)gr_unEditableContentHeight
{
    CGRect oldFrame = self.frame;
    [self sizeToFit];
    
    CGRect newFrame = self.frame;
    self.frame = oldFrame;
    
    return newFrame.size.height;
}

- (CGFloat)gr_contentHeight
{
    if ( [[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ) {
        if (self.editable) {
            return [self gr_editableContentHeight];
        } else {
            return [self gr_unEditableContentHeight];
        }
    } else {
        return [self contentSize].height;
    }
}

@end
