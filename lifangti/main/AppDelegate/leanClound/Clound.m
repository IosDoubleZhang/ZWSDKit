//
//  Clound.m
//  lifangti
//
//  Created by xthink4 on 16/6/11.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "Clound.h"
#import <AVOSCloud/AVOSCloud.h>
@implementation Clound
+(void)StartClound{
    [AVOSCloud setApplicationId:@"V9WHedqbLB4kNXsunQ25EmEl-gzGzoHsz"
                      clientKey:@"FOXd55dzrkh9wipaJ9WDtNoF"];
}

@end
