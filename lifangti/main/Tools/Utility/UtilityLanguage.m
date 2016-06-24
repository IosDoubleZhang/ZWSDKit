//
//  UtilityLanguage.m
//  lifangti
//
//  Created by xthink4 on 16/6/23.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "UtilityLanguage.h"

@implementation UtilityLanguage
static NSBundle *bundle = nil;
+ ( NSBundle * )bundle{
    return bundle;
}
+(void)initUserLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *string = [def valueForKey:@"userLanguage"];
    NSArray* languages = [def objectForKey:@"AppleLanguages"];
    NSString *current = [languages objectAtIndex:0];
    string = current;
    [def setValue:current forKey:@"userLanguage"];
    [def synchronize];
    //获取文件路径
    NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
    bundle = [NSBundle bundleWithPath:path];//生成bundle
}

+(NSString *)userLanguage{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:@"userLanguage"];
    return language;
}

+(void)setUserlanguage:(NSString *)language{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
    
    //2.持久化
    [def setValue:language forKey:@"userLanguage"];
    [def synchronize];
}
+(NSString *)NSloca:(NSString *)str
{
    
    
    if ([[[UtilityLanguage bundle]localizedStringForKey:str value:nil table:@"Localizable"] isEqualToString:@""]||[[UtilityLanguage bundle]localizedStringForKey:str value:nil table:@"Localizable"]==nil) {
        return NSLocalizedString(str, @"");
        
    }
    else
    {
        return  [[UtilityLanguage bundle]localizedStringForKey:str value:nil table:@"Localizable"];
        
    }
    
    
    
}
+(NSString*)NSNewloca
{
    
    
    NSArray *languages = [NSLocale preferredLanguages];
    NSString *currentLanguage = [languages objectAtIndex:0];
    NSLog(@"%@",currentLanguage);
    //[LanguageChooseController userLanguage]
    if ([currentLanguage isEqualToString:@"zh-Hans-CN"]) {
        [Utility sharedUtility].NowUsedLanguage=[UtilityLanguage NSloca:@"中文"];
        return [Utility sharedUtility].NowUsedLanguage;
    }
    else{
        [Utility sharedUtility].NowUsedLanguage=[UtilityLanguage NSloca:@"英文"];
        return [Utility sharedUtility].NowUsedLanguage;
        
    }
    
}

+(NSString*)NSUserloca
{
    
    
    
    if ([[Utility sharedUtility].NowUsedLanguage isEqualToString:[UtilityLanguage NSloca:@"中文"]]) {
        return [UtilityLanguage NSloca:@"中文"];
    }
    else{
        return [UtilityLanguage NSloca:@"英文"];
        
    }
    
}

@end
