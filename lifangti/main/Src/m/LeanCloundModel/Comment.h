//
//  Comments.h
//  lifangti
//
//  Created by xthink4 on 16/6/29.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
@class TheCube;
@interface Comments : AVObject<AVSubclassing>
@property (nonatomic,copy)  AVUser *        pushUser;
@property (nonatomic,copy)  TheCube *       Cube;
@property (nonatomic,copy)  NSString *      Comments;
@end
