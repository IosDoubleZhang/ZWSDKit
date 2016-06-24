//
//  UtilityLanguage.h
//  lifangti
//
//  Created by xthink4 on 16/6/23.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Utility.h"
@interface UtilityLanguage : Utility
///获取当前资源文件
+(NSBundle *)bundle;
///初始化语言文件
+(void)initUserLanguage;
///获取应用当前语言
+(NSString *)userLanguage;
///设置当前语言
+(void)setUserlanguage:(NSString *)language;
///国际 化键值匹配
+(NSString *)NSloca:(NSString *)str;
///系统当前语言版本
+(NSString *)NSNewloca;
///用户当前语言
+(NSString*)NSUserloca;
@end
