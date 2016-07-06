//
//  LftUser.h
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>

@interface LftUser :  AVUser<AVSubclassing>
@property (nonatomic,copy)  NSString *      nickname;
@property (nonatomic,copy)  NSString *      age;
@property (nonatomic,strong)AVGeoPoint*     loaction;
@end
