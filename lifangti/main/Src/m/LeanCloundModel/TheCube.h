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
@property (nonatomic,strong)NSMutableArray *images;
@property (nonatomic,strong)NSString *      species;
@property (nonatomic,strong)AVGeoPoint*     loaction;
@property (nonatomic,strong)AVRelation *    comment;
@property (nonatomic,strong)AVRelation *    star;

@end
