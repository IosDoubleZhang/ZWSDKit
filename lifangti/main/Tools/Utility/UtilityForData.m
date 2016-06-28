//
//  UtilityForData.m
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "UtilityForData.h"

@implementation UtilityForData
+(BOOL)writeLocalFileWithData:(NSDictionary *)dic with:(NSString *)key
{
    NSString *path = [NSString stringWithFormat:@"%@/Documents/%@.txt",NSHomeDirectory(),key];
    NSMutableData *mulData = [NSMutableData data];
    //通过mulData构造archiver
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:mulData];
    //编码
    [archiver encodeObject:dic forKey:key];
    //结束编码
    [archiver finishEncoding];
    BOOL ret =[mulData writeToFile:path atomically:YES];
    if (ret) {
        return YES;
    }
    else
    {
        return NO;
    }
}
+ (NSDictionary *)readLocalFilewith:(NSString *)key
{
    NSString *path = [NSString stringWithFormat:@"%@/Documents/%@.txt",NSHomeDirectory(),key];
    NSData *data = [NSData dataWithContentsOfFile:path];
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    
    NSDictionary *dict = [unarchiver decodeObjectForKey:key];
    
    
    DTLog(@"dict = %@", dict);
    return dict;
    
}

@end
