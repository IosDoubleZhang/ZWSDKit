//
//  myPoint.h
//  zhaojiuwanwu
//
//  Created by guozhou-MAC001 on 15/7/2.
//  Copyright (c) 2015年 guozhou-MAC001. All rights reserved.
//


#import <AVOSCloud/AVOSCloud.h>

@interface myPoint :AVObject<AVSubclassing>
@property (nonatomic,copy)NSString *content;
@property (nonatomic,retain)AVUser *pub;
@property (nonatomic,assign)AVGeoPoint *location;
@property (nonatomic,assign)double duration;
@property (nonatomic,copy)AVFile *img;
@property (nonatomic,copy)AVFile *video;
@property (nonatomic,copy)AVFile *videoThumbnail;
@property (nonatomic,retain)NSMutableArray *comments;
@property (nonatomic,copy)NSMutableArray *imgs;
@property (nonatomic,retain)NSMutableArray *zambiaArr;
@property (nonatomic,assign)NSInteger reward;
@property (nonatomic,assign)NSInteger flag;
@property (nonatomic,copy)NSString *userimg;
@property (nonatomic,copy)NSString *username;
@property (nonatomic,copy)NSString *dist;
@property (nonatomic,copy)NSString *sex;
@property (nonatomic,copy)NSString *age;
@property (nonatomic,assign)BOOL *isCashSelected;
@property (nonatomic,copy)NSString *nickname;
@property (nonatomic,assign)NSInteger upvotes;
@end
