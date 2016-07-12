





//
//  AcubeView.m
//  lifangti
//
//  Created by xthink4 on 16/7/11.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "AcubeView.h"

@implementation AcubeView
{
    
    __weak IBOutlet UIView *v2;
    __weak IBOutlet UIView *v1;
    __weak IBOutlet NSLayoutConstraint *Titlong;
    CGRect f1;
    CGRect f2;
}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
-(void)reloadView{
    [self SetLTMorphingLabel:_info Text:_cube.story Withtype:9];
    [self SetLTMorphingLabel:_title Text:_cube.title Withtype:9];
    [self SetLTMorphingLabel:_titleNumber Text:@"第一百五十七章" Withtype:9];
    CGSize size = [_titleNumber sizeThatFits:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    NSLog(@"%f",size.width);
    Titlong.constant=size.width+15;
    [self layoutIfNeeded];
}
- (void)drawRect:(CGRect)rect {
    _info.delegate=self;
    _title.delegate=self;
    _titleNumber.delegate=self;
    [self setInto];
    __weak typeof(self) wself = self;
    double delayInSeconds = 0.4;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC); dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        if (wself.cube) {
            [wself reloadView];
        }
        
    });


}
-(void)setInto{
    f1=v1.frame;
    f2=v2.frame;
    v1.frame=CGRectMake(0, _S_Height, _S_Width, 0) ;
    v2.frame=CGRectMake(0, _S_Height, _S_Width, 0) ;
    [UtilityPopManager initailzerAnimationWithToPostion:f1 formPostion:v1.frame atView:v1 beginTime:0.1];
    [UtilityPopManager initailzerAnimationWithToPostion:f2 formPostion:v2.frame atView:v2 beginTime:0.1];
}
-(void)SetLTMorphingLabel:(LTMorphingLabel*)la Text:(NSString *)str  Withtype:(NSInteger)type
{
    if (!type||type>8) {
        type=arc4random()%7;
    }
    
   
        la.text=str;

   
    
    la.morphingEffect=type;
    
}
//-(NSString *)shupai:(NSString *)string
//{
//    NSMutableString *str=[NSMutableString new];
//    for (int i = 0; i<[string length]; i++) {
//        //截取字符串中的每一个字符
//        NSString *s = [string substringWithRange:NSMakeRange(i, 1)];
//        NSLog(@"%@",s);
//    [str stringByAppendingString:[NSString stringWithFormat:@"%@\n",s]];
//        
//    }
//    NSLog(@"%@",str);
//    
//    return str;
//}
#pragma mark LTMorphingLabelDelegate
-(void) morphingDidStart:(LTMorphingLabel *)label
{
    
}
-(void)morphingDidComplete:(LTMorphingLabel *)label
{
    
}
-(void)morphingOnProgress:(LTMorphingLabel *)label progress:(float)progress
{
    
}
@end
