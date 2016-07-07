//
//  TheCube.h
//  lifangti
//
//  Created by xthink4 on 16/6/29.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <AVOSCloud/AVOSCloud.h>
@class Comment;
@interface TheCube : AVObject<AVSubclassing>
@property (nonatomic,copy)  NSString *      title;
@property (nonatomic,copy)  NSString *      content;
@property (nonatomic,copy)  AVUser *        user;
@property (nonatomic,copy)NSMutableArray *images;
@property (nonatomic,copy)AVFile         *image;
@property (nonatomic,copy)NSString *      species;
@property (nonatomic,copy)AVGeoPoint*     loaction;
@property (nonatomic,copy)AVRelation *    comment;
@property (nonatomic,copy)AVRelation *    star;

@end
