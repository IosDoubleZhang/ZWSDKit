//
//  UtilityForTime.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityForTime : NSObject
///判断星座
+(NSString *)getXingzuo:(NSDate *)inDate;
///一个时间距离现在多长时间
+(NSString*)nowdatewithStr:(NSDate *)date;
@end
