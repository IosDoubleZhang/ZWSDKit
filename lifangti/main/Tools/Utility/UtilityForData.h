//
//  UtilityForData.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UtilityForData : NSObject
///本地化存写简单的字典信息
+(BOOL)writeLocalFileWithData:(NSDictionary *)dic with:(NSString *)key;
///本地化读取简单的字典信息
+ (NSDictionary *)readLocalFilewith:(NSString *)key;
@end
