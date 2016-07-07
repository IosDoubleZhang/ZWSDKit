//
//  CubeImg.h
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CubeImg  : AVObject<AVSubclassing>
@property (nonatomic,copy)  AVUser *        user;
@property (nonatomic,copy)  TheCube *       cube;
@property (nonatomic,copy)  AVFile *        img;
@end
