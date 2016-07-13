//
//  CoreMotionView.h
//  lifangti
//
//  Created by xthink4 on 16/7/12.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseXibVIew.h"
@interface CoreMotionView : BaseXibVIew
@property (weak, nonatomic) IBOutlet UIScrollView *imgsView;
//@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (strong, nonatomic) UIImageView *img;
-(void)img:(UIImage *)img;
@end
