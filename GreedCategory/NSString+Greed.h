//
//  NSString+Greed.h
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Greed)

#pragma mark - static

/**
 *  米->千米
 *
 */
+ (NSString*)gr_distanceFromMeter:(CGFloat)meter;

+ (NSString*)gr_fileSizeForByte:(long long)byte;

#pragma mark - not static

- (BOOL)gr_isPureInt;
- (BOOL)gr_isPureInteger;

/**
 *  去除两端空格和回车
 */
- (NSString*)gr_trimmingCharacters;

- (BOOL)gr_isHtmlString;
- (NSString*)gr_firstImg;

/**
 *  多个换行替换成一个换行
 */
- (NSString*)gr_replaceMultEnterToOneEnter;

/**
 *  url encode
 */
- (NSString*)gr_urlEncode;
/**
 *  13007124303 -> 130*****303
 */
- (NSString *)getPriatePhoneNumber;
@end
