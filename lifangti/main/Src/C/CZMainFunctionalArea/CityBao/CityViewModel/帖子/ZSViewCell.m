//
//  ZSViewCell.m
//  CityBao3-0
//
//  Created by xthink4 on 16/7/1.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "ZSViewCell.h"

@implementation ZSViewCell
{
    
    __weak IBOutlet UIView *BgView;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    BgView.layer.shadowColor=[UIColor blackColor].CGColor;
    BgView.layer.shadowOffset=CGSizeMake(1, 1);
    BgView.layer.shadowOpacity=0.1;
    BgView.layer.shadowRadius=8;
//    BgView.layer.shadowColor=[[UIColor blackColor] CGColor];
//    for (int i=1001; i<=1004; i++) {
//        [UtilityForUI CreatView:i FromView:self].contentMode=UIViewContentModeScaleAspectFill;
//        
//    }
    
//    BgView.layer.borderWidth=1;
    
    // Initialization code
}
- (void)setSelected:(BOOL)selected
{
    NSLog(@"11");
}
//-(void)setHighlighted:(BOOL)highlighted
//{
//  
//        [super setHighlighted:highlighted ];
//        if (self.highlighted) {
//            return;
//        } else {
//            POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleX];
//            scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
////            scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(8,8)];
//            scaleAnimation.springBounciness = 1;
//            [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//        }
//   
//}
@end
