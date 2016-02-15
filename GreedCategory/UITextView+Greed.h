//
//  UITextView+Greed.h
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (Greed)

/**
 * tableview reload的时候textview会自动resign，加canResign防止自动resion
 */
@property (nonatomic, assign) BOOL gr_canResign;

#pragma mark - content height

/**
 * height when editable is YES
 **/
- (CGFloat)gr_editableContentHeight;

/**
 * height when editable is NO
 **/
- (CGFloat)gr_unEditableContentHeight;

/**
 * height no matter editable is YES or NO
 **/
- (CGFloat)gr_contentHeight;

@end
