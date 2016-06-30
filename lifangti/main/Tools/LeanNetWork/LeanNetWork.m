//
//  LeanNetWork.m
//  lifangti
//
//  Created by xthink4 on 16/6/28.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "LeanNetWork.h"

@implementation LeanNetWork
+(void)ObjcSaveInBackground:(void (^)())success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(AVObject*)objc{
    
    [objc saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // 存储成功
            success();// 保存成功之后，objectId 会自动从云端加载到本地
        } else {
            faliure(error.localizedDescription);
            // 失败的话，请检查网络环境以及 SDK 配置是否正确
        }
    }];
}
+(void)FileSavewInBackGround:(void (^)())success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(AVFile*)objc
{
    [objc saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            success();
        }
        else{
            faliure (error.localizedDescription);
        }
    }];
}
+(void)GetAVobjectBackground:(void (^)(NSArray*parse))success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(NSString*)objcClassName AndObjcID:(NSString *)ObjcID;
{
    AVQuery *query = [AVQuery queryWithClassName:objcClassName];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
  
        if (error) {
            faliure(error.localizedDescription);
        }
        else{
        success([NSArray arrayWithArray:objects]);
        }
        
    }];
}
+(void)DeleTeAVobjectBackground:(VoidBlock)success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(NSString*)objcClassName AndObjcID:(NSString *)ObjcID
{
    AVQuery *query = [AVQuery queryWithClassName:objcClassName];
    [query deleteAllInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            faliure(error.localizedDescription);
        }
        else{
            success();
            NSLog(@"单条数据删除成功");
        }

    }];
}
+(void)ALLobjcSaveInBackground:(VoidBlock)success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(NSArray*)AVobjcArr
{
    [AVObject saveAllInBackground:AVobjcArr block:^(BOOL succeeded, NSError *error) {
        if (error) {
            // 出现错误
            faliure(error.localizedDescription);
        } else {
            // 保存成功
            success();
        }
    }];
}

//+(void)testV
//{
//    for (int i=0; i<50; i++) {
//        myPoint *apoint =[AVObject objectWithClassName:@"myPoint"];
//        [apoint setObject:[NSString stringWithFormat:@"这是一条测试数据%d!+++++++",i] forKey:@"dist"];
//        NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"account_highlight"], 1);
//        AVFile *file = [AVFile fileWithName:@"img.jpg" data:imageData];
//        [apoint setObject:file forKey:@"img"];
//    [LeanNetWork ObjcSaveInBackground:^{
//        NSLog(@"%d success",i);
//        
//    } faliue:^(NSString *errorMessage) {
//        NSLog(@"%@",errorMessage);
//    } WithObjc:apoint];
//    }
//
//}
+(void)testV
{
//    for (int i=0; i<20; i++) {
//        myPoint *apoint =[AVObject objectWithClassName:@"myPoint"];
//        [apoint setObject:[NSString stringWithFormat:@"这是一个麻痹%d!+++++++",i] forKey:@"dist"];
//        NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"account_highlight"], 1);
//        AVFile *file = [AVFile fileWithName:@"img.jpg" data:imageData];
//        [apoint setObject:file forKey:@"img"];
//        [LeanNetWork ObjcSaveInBackground:^{
//            NSLog(@"%d success",i);
//            
//        } faliue:^(NSString *errorMessage) {
//            NSLog(@"%@",errorMessage);
//        } WithObjc:apoint];
//    }

    myPoint *apoint =[myPoint objectWithClassName:@"myPoint"];
    [apoint setObject:[NSString stringWithFormat:@"2222222222222222222这是一条测试数据!+++++++"] forKey:@"dist"];
    NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"account_normal"], 1);
    AVFile *file = [AVFile fileWithName:@"img.jpg" data:imageData];
    [apoint setObject:file forKey:@"img"];
    
    myPoint *apoint2 =[myPoint objectWithClassName:@"myPoint"];
    [apoint2 setObject:[NSString stringWithFormat:@"1111111111111111111111这是一条测试数据!+++++++"] forKey:@"dist"];
    NSData *imageData2 = UIImageJPEGRepresentation([UIImage imageNamed:@"account_normal"], 1);
    AVFile *file2 = [AVFile fileWithName:@"img.jpg" data:imageData2];
    [apoint2 setObject:file2 forKey:@"img"];
    
    myPoint *apoint3 =[myPoint objectWithClassName:@"myPoint"];
    [apoint3 setObject:[NSString stringWithFormat:@"1111111111111111111111这是一条测试数据!+++++++"] forKey:@"dist"];
    NSData *imageData3 = UIImageJPEGRepresentation([UIImage imageNamed:@"account_normal"], 1);
    AVFile *file3 = [AVFile fileWithName:@"img.jpg" data:imageData3];
    [apoint3 setObject:file3 forKey:@"img"];
    NSArray *arr=@[apoint,apoint2,apoint3];
    [LeanNetWork ALLobjcSaveInBackground:^{
        NSLog(@"success");
    } faliue:^(NSString *errorMessage) {
        
    } WithObjc:arr];
}


+ (NSArray<AVObject *>*)getObjc
{
    AVQuery *query = [AVQuery queryWithClassName:@"myPoint"];
    __block NSArray<AVObject *> * nearByPoint;
    [query whereKey:@"dist" containsString:@"麻痹"];
    query.limit = 10;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            DTLog(@"%@",error.localizedDescription);
        } else {
             nearByPoint = objects;
        }
    }];
    return nearByPoint;
}

@end
