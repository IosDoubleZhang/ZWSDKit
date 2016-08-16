//
//  EaseBtn.h
//  lifangti
//
//  Created by xthink4 on 16/7/25.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "BaseXibVIew.h"

@interface EaseBtn : BaseXibVIew
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UIImageView *bgimg;
@property (weak, nonatomic) IBOutlet UILabel *title;
-(void)Start;
-(void)End;
@end
