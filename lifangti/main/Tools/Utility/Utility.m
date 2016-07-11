//
//  Utility.m
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "Utility.h"

@implementation Utility
+ (Utility *)sharedUtility
{
    static Utility *sharedUtilityInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedUtilityInstance = [[self alloc] init];
        
    });
    return sharedUtilityInstance;
}
+(void)ClearImg
{
    [[YYImageCache sharedCache].memoryCache removeAllObjects];
    [[YYImageCache sharedCache].diskCache removeAllObjectsWithBlock:^{}];
}
@end
