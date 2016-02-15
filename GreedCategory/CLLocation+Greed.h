//
//  CLLocation+Greed.h
//  Pods
//
//  Created by Bell on 16/2/15.
//  Copyright © 2016年 GreedLab. All rights reserved.
//


#import <CoreLocation/CoreLocation.h>

@interface CLLocation (Greed)

#pragma mark - CLLocation

/**
 *  从地图坐标转化到火星坐标
 *
 */
- (CLLocation*)gr_locationMarsFromEarth;

/**
 *  从火星坐标转化到百度坐标
 */
- (CLLocation*)gr_locationBaiduFromMars;

/**
 *  从百度坐标到火星坐标
 */
- (CLLocation*)gr_locationMarsFromBaidu;

/**
 *  从火星坐标到地图坐标
 */
- (CLLocation*)gr_locationEarthFromMars;

#pragma mark - CLLocationCoordinate2D

/**
 *  从百度坐标转化到火星坐标
 *
 */
+ (CLLocationCoordinate2D)gr_marsCoordinateFromBaidu:(CLLocationCoordinate2D)coordinate;

/**
 *  从火星坐标转化到百度坐标
 *
 */
+ (CLLocationCoordinate2D)gr_baiduCoordinateFromMars:(CLLocationCoordinate2D)coordinate;

@end
