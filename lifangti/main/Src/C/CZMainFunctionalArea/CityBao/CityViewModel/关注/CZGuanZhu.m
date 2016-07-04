




//
//  CZGuanZhu.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/30.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CZGuanZhu.h"
#import "CZGuanZhuTableViewCell.h"
@implementation CZGuanZhu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    [UtilityForUI Zhuce:_GuanZhuTable Regiest:@"CZGuanZhuTableViewCell" WithId:@"GuanZhuCell"];
    
    // Drawing code
}
@end
