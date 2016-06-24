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
+(void)initUserLanguage;//初始化语言文件
+(NSString *)userLanguage;//获取应用当前语言
+(void)setUserlanguage:(NSString *)language;//设置当前语言
///国际 化键值匹配
+(NSString *)NSloca:(NSString *)str;
///系统当前语言版本
+(NSString *)NSNewloca;

+(NSString*)NSUserloca;
@end
