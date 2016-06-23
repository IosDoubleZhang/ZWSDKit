//
//  UtilityForUI.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityForUI : NSObject
///按钮的选中的事件选中状态和非选择状态
+(void)ButtonSelected:(void (^)())selected Unselected:(void (^)())Unselected  withSender:(UIButton *)sender;
///设置按钮的图片
+(UIButton*)SetImgButton:(NSString *)Img andButtonSelected:(NSString *)SelectedImg ForSender:(UIButton *)Sender;
@end
