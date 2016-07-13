//
//  AcubeView.h
//  lifangti
//
//  Created by xthink4 on 16/7/11.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseXibVIew.h"
#import "LTMorphingLabel-Swift.h"
#import "CoreMotionView.h"
@interface AcubeView : BaseXibVIew<LTMorphingLabelDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *Img;
@property (weak, nonatomic) IBOutlet LTMorphingLabel *info;
@property (weak, nonatomic) IBOutlet LTMorphingLabel *title;
@property (weak, nonatomic) IBOutlet LTMorphingLabel *titleNumber;
@property (strong, nonatomic)  TheCube    *cube;
@end
