







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
    _title.text=_cube.title;
    _locationName.text=_cube.content;
    [_infoImg setImageWithURL:[NSURL URLWithString:_cube.image.url]
                       placeholder:nil
                           options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity | YYWebImageOptionSetImageWithFadeAnimation
                          progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                           
                          } transform:nil
                        completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                            if (stage == YYWebImageStageFinished) {
                               
                            }
                        }];
}
- (void)clear{
    if (!drawed) {
        return;
    }

    _infoImg.image = [UIImage imageNamed:@"a4.jpg"];
    _title.text=@"";
    drawed = NO;
}
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (self.highlighted) {
        POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.duration = 10;
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
        [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
          } else {
        POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
        scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1          )];
        scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(6,6)];
        scaleAnimation.springBounciness = 15.f;
        [self.infoImg pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
      
    }
}


- (IBAction)iconAction:(UIButton *)sender {
    
    Comment *acom=[Comment object];
    acom.content=@"111111111111111111";
    acom.user=[AVUser currentUser];
    NSLog(@"%@",_cube.title);
    

    [LeanNetBase addAComment:acom toCube:_cube Success:^{
        NSLog(@"---------success-------");
        AVQuery *query = [_cube.comment query];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            NSLog(@"0---------0-----%@",objects);
            
        }];
    } AndError:^(NSString *parse) {
        
    }];
    
}

@end
