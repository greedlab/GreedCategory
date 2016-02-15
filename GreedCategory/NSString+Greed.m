//
//  NSString+Greed.m
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//

#import "NSString+Greed.h"

@implementation NSString (Greed)

#pragma mark - static

+ (NSString*)gr_distanceFromMeter:(CGFloat)meter
{
    if (meter < 1000.f) {
        return [NSString stringWithFormat:@"%0.0fm",meter];
    } else if ( meter < 100.f * 1000.f){
        return [NSString stringWithFormat:@"%0.2fkm",meter / 1000.f];
    } else {
        return [NSString stringWithFormat:@"%0.0fkm",meter / 1000.f];
    }
}

+ (NSString*)gr_fileSizeForByte:(long long)byte {
    if (byte < 1024) {
        return [NSString stringWithFormat:@"%lldB",byte];
    } else if (byte < 1024 * 1024) {
        return [NSString stringWithFormat:@"%0.2fK",(CGFloat)byte / 1024.0];
    } else if (byte < 1024 * 1024 * 1024) {
        return [NSString stringWithFormat:@"%0.2fM",(CGFloat)byte / (1024.0 * 1024.0)];
    } else {
        return [NSString stringWithFormat:@"%0.2fG",(CGFloat)byte / (1024.0 * 1024.0 * 1024.0)];
    }
}

#pragma mark - not static

- (BOOL)gr_isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)gr_isPureInteger
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    NSInteger val;
    return[scan scanInteger:&val] && [scan isAtEnd];
}

- (NSString*)gr_trimmingCharacters
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (BOOL)gr_isHtmlString
{
    if (self.length == 0) {
        return NO;
    }
    NSRange begninRange = [self rangeOfString:@"<"];
    if (begninRange.length == 0) {
        return NO;
    }
    NSString *string = [self substringFromIndex:(begninRange.location + begninRange.length)];
    NSRange endRange = [string rangeOfString:@">"];
    if (endRange.length == 0) {
        return NO;
    }
    return YES;
}

- (NSString*)gr_firstImg
{
    NSString *resultString = [self copy];
    NSString *imgHeader = @"<img";
    NSRange imgHeaderRange = [resultString rangeOfString:imgHeader];
    if (imgHeaderRange.length == 0) {
        return nil;
    }
    resultString = [resultString substringFromIndex:imgHeaderRange.location + imgHeaderRange.length];
    
    NSString *imgTail = @">";
    NSRange imgTailRange = [resultString rangeOfString:imgTail];
    if (imgTailRange.length == 0) {
        return nil;
    }
    
    resultString = [resultString substringToIndex:imgTailRange.location];
    
    NSString *srcHeader = @"src=\"";
    NSRange srcHeaderRange = [resultString rangeOfString:srcHeader];
    if (srcHeaderRange.length == 0) {
        return nil;
    }
    resultString = [resultString substringFromIndex:srcHeaderRange.location + srcHeaderRange.length];
    
    NSString *srcTail = @"\"";
    NSRange srcTailRange = [resultString rangeOfString:srcTail];
    if (srcTailRange.length == 0) {
        return nil;
    }
    resultString = [resultString substringToIndex:srcTailRange.location];
    return resultString;
}

- (NSString*)gr_replaceMultEnterToOneEnter
{
    if (self.length) {
        NSString *pattern = @"\n{1,}";
        NSError *error;
        NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:&error];
        if (!error) {
            return [regular stringByReplacingMatchesInString:self options:0 range:NSMakeRange(0, self.length) withTemplate:@"\n"];
        }
    }
    return self;
}

- (NSString*)gr_urlEncode
{
    NSString * encodedString = (__bridge_transfer  NSString*) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 );
    return encodedString;
}

@end
