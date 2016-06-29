//
//  Star.h
//  lifangti
//
//  Created by xthink4 on 16/6/29.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
#import "TheCube.h"
@interface CubeStar : AVObject<AVSubclassing>
@property (nonatomic,copy)  AVUser *        user;
@property (nonatomic,copy)  TheCube *       cube;
@end
