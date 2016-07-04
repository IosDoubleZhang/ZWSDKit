







//
//  CZTuiJIanTableViewCell.m
//  CityBao3-0
//
//  Created by xthink4 on 16/7/1.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CZTuiJIanTableViewCell.h"

@implementation CZTuiJIanTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self Test];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)Test
{
    for (int i=1001; i<=1006; i++) {
        UIImageView *a=   (UIImageView *)[UtilityForUI FindView:i FromView:self];
        a.image=[UIImage imageNamed:[NSString stringWithFormat:@"a%u.jpg",((arc4random() % 5) + 1)]];
    }
    _CZHeaderBagImg.image=[UIImage imageNamed:[NSString stringWithFormat:@"u%u.jpg",((arc4random() % 2) + 1)]];
}
@end
