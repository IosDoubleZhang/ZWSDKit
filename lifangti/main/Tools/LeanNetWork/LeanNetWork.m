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
+(void)testV
{
    for (int i=0; i<50; i++) {
        myPoint *apoint =[AVObject objectWithClassName:@"myPoint"];
        [apoint setObject:[NSString stringWithFormat:@"这是一条测试数据%d!+++++++",i] forKey:@"dist"];
        NSData *imageData = UIImageJPEGRepresentation([UIImage imageNamed:@"account_highlight"], 1);
        AVFile *file = [AVFile fileWithName:@"img.jpg" data:imageData];
        [apoint setObject:file forKey:@"img"];
    [LeanNetWork ObjcSaveInBackground:^{
        NSLog(@"%d success",i);
        
    } faliue:^(NSString *errorMessage) {
        NSLog(@"%@",errorMessage);
    } WithObjc:apoint];
    }

}

@end
