


//
//  CoreMotionView.m
//  lifangti
//
//  Created by xthink4 on 16/7/12.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CoreMotionView.h"

#import "MPIMotionManager.h"
@implementation CoreMotionView
#define UPDATE_INTERVAL 0.5
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)img:(UIImage *)img
{
    _img=[[UIImageView alloc]init];
    _img.frame=CGRectMake(0, 0, _S_Width*1.5, _S_Height);
    _img.contentMode=UIViewContentModeScaleAspectFill;
    _img.image=img;
    [_imgsView addSubview:_img];
    
    [self start];
    
}
-(void)start
{
    __weak typeof(self) ws =self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [[MPIMotionManager sharedManager] getAccelerometerValuesWithTimeInterval:UPDATE_INTERVAL
                                                                      andHandler:^ (MPIMotionData motionAccelData)
         {
             //do something with motionAccelData like:
             NSLog(@"%f %f %f", motionAccelData.x, motionAccelData.y, motionAccelData.z);
             [UIView animateWithDuration:01 animations:^{
                 NSLog(@"%lf",(_S_Width/2*1.5)*(1-motionAccelData.x*4));
                 double x=(_S_Width/2*1.5)*(1-motionAccelData.x*4);
                 if (x>_S_Width*0.5){
                            ws.imgsView.contentOffset=CGPointMake(_S_Width/2, 0);
                 }
                 else if (x<-_S_Width/2)
                 {
                            ws.imgsView.contentOffset=CGPointMake(0, 0);
                 }
                 else{
                    ws.imgsView.contentOffset=CGPointMake((_S_Width/2*1.5)*(1-motionAccelData.x*4), 0);
                 }
                
             }];
         }];
//something
    });
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    _imgsView.frame=CGRectMake(0, 0, _S_Width, _S_Height);
    _imgsView.contentSize=CGSizeMake(_S_Width*1.5, _S_Height);
    _imgsView.contentOffset=CGPointMake(_S_Width/4, 0);
    _imgsView.scrollEnabled=NO;
    _imgsView.bounces=NO;
    
    
}
@end
