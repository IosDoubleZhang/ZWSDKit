//
//  UtilityForLocation.m
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "UtilityForLocation.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
@implementation UtilityForLocation
const static NSString *APIKey = @"7dcd660de1ef7633d73f2cb2a45719e7";
+(double)disWithloactiona:(CLLocation *)dist

{

    CLLocationDistance kio=[[Utility sharedUtility].Userlocation distanceFromLocation:dist];
    NSLog(@"%@",[NSString stringWithFormat:@"%f",kio]);
    
    double dis=kio/1000;
    return dis;
    
}
-(void)startTimer 
{
    if(!_timer){
        //创建一个定时器，这个是直接加到当前消息循环中，注意与其他初始化方法的区别
        _timer=[NSTimer scheduledTimerWithTimeInterval:30.0 target:self
                                              selector:@selector(userGps) userInfo:nil repeats:YES];
        //  [_timer fire]; //对于这个fire方法，稍后会详解，它不是启动一个定时器，这么简单
    }
}
-(void)userGps
{
    
}
-(void)stopTimer
{
    if (_timer) {
        NSLog(@"调用 self.time为真！！");
        //如果定时器在运行
        if ([self.timer isValid]) {
            NSLog(@"单击停止按钮，取消定时器！！");
            [self.timer invalidate];
            //这行代码很关键
            _timer=nil;
        }
    }
}
+ (void)configureAPIKey
{
    if ([APIKey length] == 0)
    {
#define kMALogTitle @"提示"
#define kMALogContent @"apiKey为空，请检查key是否正确设置"
        
        NSString *log = [NSString stringWithFormat:@"[MAMapKit] %@", kMALogContent];
        NSLog(@"%@", log);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:kMALogTitle message:kMALogContent delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            
            [alert show];
        });
    }
    
    [AMapServices sharedServices].apiKey = (NSString *)APIKey;
}
@end
