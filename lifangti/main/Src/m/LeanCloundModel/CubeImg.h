//
//  CubeImg.h
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CubeImg  : AVObject<AVSubclassing>
@property (nonatomic,strong)  AVUser *        user;
@property (nonatomic,strong)  TheCube *       cube;
@property (nonatomic,strong)  AVFile *        img;
@end
