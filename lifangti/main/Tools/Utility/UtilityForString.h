//
//  UtilityForString.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface UtilityForString : NSObject
///判断是不是手机号
+(BOOL) isValidateMobile:(NSString *)mobile;
///正则匹配用户密码6-18位数字和字母组合
+ (BOOL)checkPassword:(NSString *) password;
///正则匹配用户姓名,20位的中文
+ (BOOL)checkUserNameHanzi : (NSString *) userName;
///正则匹配用户姓名,20位的中文或英文
+ (BOOL)checkUserName : (NSString *) userName;
///正则匹配用户姓名,20位的中文英文
+ (BOOL)checkUserDetail : (NSString *) userName;
///正则匹配用户身份证号
+ (BOOL)checkUserIdCard: (NSString *) idCard;
///正则匹员工号,12位的数字
+ (BOOL)checkEmployeeNumber : (NSString *) number;
///正则判断数字,1到30位的数字
+ (BOOL)checkNumber1_30wei : (NSString *) number;
@end
