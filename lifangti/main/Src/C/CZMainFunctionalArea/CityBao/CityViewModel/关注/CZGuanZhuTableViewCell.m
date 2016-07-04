//
//  CZGuanZhuTableViewCell.m
//  CityBao3-0
//
//  Created by xthink4 on 16/7/4.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CZGuanZhuTableViewCell.h"

@implementation CZGuanZhuTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)LoadImgWithIMGS:(NSArray *)arr{
    for (int i=1000; i<=1003; i++) {
        UIImageView*img=(UIImageView *)[UtilityForUI FindView:i FromView:self];
        [img setImage:[UIImage imageNamed:@"a1"]];
    }
}

@end
