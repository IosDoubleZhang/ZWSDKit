//
//  CZGuanZhuTableViewCell.h
//  CityBao3-0
//
//  Created by xthink4 on 16/7/4.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZGuanZhuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Title;
@property (weak, nonatomic) IBOutlet UILabel *amount;
-(void)LoadImgWithIMGS:(NSArray *)arr;

@end
