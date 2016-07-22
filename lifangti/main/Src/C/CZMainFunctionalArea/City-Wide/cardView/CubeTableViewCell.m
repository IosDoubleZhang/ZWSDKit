







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


    // Configure the view for the selected state
}
-(void)LoadData
{
    if (drawed) {
        return;
    }

    drawed = YES;
    _title.text=NSLocalizedString(@"fa-chrome", nil);
    _title.font= [UIFont fontWithName:@"FontAwesome" size:20.0];
    
    _locationName.text=_cube.story;
    [_infoImg setImageWithURL:[NSURL URLWithString:_cube.image.url]
                       placeholder:nil
                           options:YYWebImageOptionProgressiveBlur | YYWebImageOptionShowNetworkActivity | YYWebImageOptionSetImageWithFadeAnimation
                          progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                          } transform:nil
                        completion:^(UIImage *image, NSURL *url, YYWebImageFromType from, YYWebImageStage stage, NSError *error) {
                            if (stage == YYWebImageStageFinished) {
                               
                            }
                        }];
//    [_cube.image getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
//        // data 就是文件的数据流
//        _infoImg.image=[UIImage imageWithData:data];
//    } progressBlock:^(NSInteger percentDone) {
//        //下载的进度数据，percentDone 介于 0 和 100。
//    }];
//    _infoImg.image=[UIImage imageNamed:@"a1.jpg"];
//    [_cube.image getThumbnail:YES width:900 height:900 withBlock:^(UIImage *image, NSError *error) {
//        
//        _infoImg.image=image;
//    }];
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
//    [self bodong];
}
-(void)huifu
{
    POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
    scaleAnimation.duration = 10;
    scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
    [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
}
-(void)bodong
{
    
        if (self.highlighted) {
            POPBasicAnimation *scaleAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
            scaleAnimation.duration = 10;
            scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
            [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
              } else {
            POPSpringAnimation *scaleAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
            scaleAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(1, 1)];
            scaleAnimation.velocity = [NSValue valueWithCGPoint:CGPointMake(8,8)];
            scaleAnimation.springBounciness = 15.f;
            [self pop_addAnimation:scaleAnimation forKey:@"scaleAnimation"];
          
        }

}
- (IBAction)iconAction:(UIButton *)sender {
    
    if (_IconBlock) {
        _IconBlock();
    }
    
//    [AVFile clearAllCachedFiles];
}

@end
