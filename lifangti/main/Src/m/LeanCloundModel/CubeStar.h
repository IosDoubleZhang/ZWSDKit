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
@property (nonatomic,strong)  AVUser *        user;
@property (nonatomic,strong)  TheCube *       cube;
@end
