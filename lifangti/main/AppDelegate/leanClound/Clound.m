//
//  Clound.m
//  lifangti
//
//  Created by xthink4 on 16/6/11.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "Clound.h"
#import "myPoint.h"
@implementation Clound
+(void)StartClound{
    [AVOSCloud setApplicationId:@"e4CoV3hV13lSwblThKUKH9v8-gzGzoHsz"
                      clientKey:@"FOUGkRwMjdu1JwPKFI4uSytA"];
    ///注册到leanClound上
//   
    [myPoint registerSubclass];
}

@end
