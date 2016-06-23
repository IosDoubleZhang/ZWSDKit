//
//  Utility.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
@interface Utility : NSObject
///单例内容 可用于传值等操作
+ (Utility *)sharedUtility;
///用户当前位置
@property(nonatomic,retain)CLLocation *Userlocation;

@end
