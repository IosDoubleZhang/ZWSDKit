//
//  UtilityForUI.m
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "UtilityForUI.h"

@implementation UtilityForUI
+(void)ButtonSelected:(void (^)())selected Unselected:(void (^)())Unselected  withSender:(UIButton *)sender{
    
    if (sender.selected==NO) {
        sender.selected=YES;
        selected();
        NSLog(@"选中");
    }
    else{
        sender.selected=NO;
        NSLog(@"未选中");
        Unselected();
        
    }
}
+(UIButton*)SetImgButton:(NSString *)Img andButtonSelected:(NSString *)SelectedImg ForSender:(UIButton *)Sender
{
    [Sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",Img]] forState:UIControlStateNormal];
    [Sender setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",SelectedImg]] forState:UIControlStateSelected];
    return Sender;
}
+(UIView*)CreatView:(NSString *)ViewName
{
    return [[[NSBundle mainBundle]loadNibNamed:ViewName owner:nil options:nil] lastObject];
    
    
}
@end
