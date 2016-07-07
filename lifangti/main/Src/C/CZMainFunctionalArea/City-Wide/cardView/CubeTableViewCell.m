







//
//  CubeTableViewCell.m
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CubeTableViewCell.h"

@implementation CubeTableViewCell
{
       BOOL drawed;
}
- (void)awakeFromNib {
    [super awakeFromNib];

    [self.title setNeedsDisplay];
 
    // Initialization code
}
-(void)morphingDidStart:(LTMorphingLabel *)label{
    
}
-(void)morphingDidComplete:(LTMorphingLabel *)label
{
    
}
-(void)morphingOnProgress:(LTMorphingLabel *)label progress:(float)progress
{
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)LoadData
{
    if (drawed) {
        return;
    }
    drawed = YES;
    _title.text=_Atitle;
     _infoImg.image = [UIImage imageNamed:@"a3.jpg"];
}
- (void)clear{
    if (!drawed) {
        return;
    }

    _infoImg.image = [UIImage imageNamed:@"a4.jpg"];
    _title.text=@"";
    drawed = NO;
}
//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
//{
//    [super setHighlighted:highlighted animated:animated];
//    if (self.highlighted) {
//        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//        scaleAnimation.duration = 10;
//        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
//        [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//          } else {
//        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1          )];
//        scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(6,6)];
//        scaleAnimation.springBounciness = 15.f;
//        [self.infoImg pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
//      
//    }
//}


- (IBAction)iconAction:(UIButton *)sender {

}

@end
