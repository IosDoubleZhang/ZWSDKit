//
//  EaseBtn.m
//  lifangti
//
//  Created by xthink4 on 16/7/25.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "EaseBtn.h"

@implementation EaseBtn
{
    __weak IBOutlet UIButton *btn;
    
    CGRect _f1;
    CGRect _f2;
    CGPoint _p1;
}
- (void)drawRect:(CGRect)rect {
    _f1=self.frame;
    _p1=self.center;
    _f2=CGRectMake(_p1.x, _p1.y- _f1.size.height/2, _f1.size.height, _f1.size.height);
    self.layer.cornerRadius=self.frame.size.height/2;
    [self.layer setMasksToBounds:YES];
}
- (IBAction)dasdas:(id)sender {
    __weak typeof(self) ws=self;
    [UtilityForUI ButtonSelected:^{
        [ws Start];
    } Unselected:^{
        [ws End];
    } withSender:sender];
}
-(void)Start{
    [UtilityPopManager initailzerAnimationWithToPostion:_f2 formPostion:_f1 atView:self beginTime:0.2 with:0];
}
-(void)End{
    [UtilityPopManager initailzerAnimationWithToPostion:_f1 formPostion:_f2 atView:self beginTime:0.2];
}
@end
