//
//  CubeTableViewCell.h
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
#import "LTMorphingLabel-Swift.h"
@interface CubeTableViewCell :BaseCell
@property(nonatomic,strong)TheCube *cube;

@property(nonatomic,weak )NSString *Atitle;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *nickname;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *locationName;
@property (weak, nonatomic) IBOutlet UIImageView *infoImg;
-(void)LoadData;
- (void)clear;
@end
