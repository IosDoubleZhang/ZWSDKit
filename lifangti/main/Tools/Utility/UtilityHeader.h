//
//  UtilityHeader.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//
#pragma mark ——————     工具类头文件     ——————
#import <Foundation/Foundation.h>
#import "UtilityForValue.h"
#import "UtilityForUI.h"
//没有配置好
#import "UtilityForUM.h"
#import "UtilityForClass.h"
#import "UtilityForString.h"
#import "UtilityForTime.h"
#import "UtilityForData.h"
#import "UtilityPopManager.h"
#import "UtilityLanguage.h"


#pragma mark ——————     宏定义的小空间     ——————

#define _S_Width [[UIScreen mainScreen] bounds].size.width
#define _S_Height [[UIScreen mainScreen] bounds].size.height
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0]
#define RGB2(r, g, b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

#ifdef DEBUG
#   define DTLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ## __VA_ARGS__);
#else
#   define DTLog(...)
#endif

#define SHOW_ALERT(_msg_)  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:_msg_ delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

///block
typedef void (^ArrayBlock)      (NSArray *parse);
typedef void (^StringBlock)     (NSString *parse);
typedef void (^VoidBlock)       ();
typedef void (^DictionaryBlock) (NSDictionary *parse);
typedef void (^DataBlock)       (NSData *parse);
typedef void (^IdObjcBlock)     (id parse);
typedef void (^ImageBlock)      (UIImage *parse);
typedef void (^BoolBlock)       (BOOL parse);





@interface UtilityHeader : NSObject

@end
