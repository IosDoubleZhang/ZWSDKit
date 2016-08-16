//
//  UtilityForLocation.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Utility.h"
@interface UtilityForLocation : NSObject
///两点间距离
+(double)disWithloactiona:(CLLocation *)dist;
@property(nonatomic,retain)NSTimer *timer;
+ (void)configureAPIKey;
@end
