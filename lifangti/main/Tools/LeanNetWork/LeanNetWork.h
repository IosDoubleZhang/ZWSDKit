//
//  LeanNetWork.h
//  lifangti
//
//  Created by xthink4 on 16/6/28.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
@interface LeanNetWork : NSObject
///保存一个对象
+(void)ObjcSaveInBackground:(VoidBlock)success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(AVObject*)objc;
///保存一个文件
+(void)FileSavewInBackGround:(VoidBlock)success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(AVObject*)objc;
///获取一个对象Parse firstObjc 
+(void)GetAVobjectBackground:(ArrayBlock)success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(NSString*)objcClassName AndObjcID:(NSString *)ObjcID;

///删除一个对象
+(void)DeleTeAVobjectBackground:(VoidBlock)success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(NSString*)objcClassName AndObjcID:(NSString *)ObjcID;

///批量存储
+(void)ALLobjcSaveInBackground:(VoidBlock)success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(NSArray*)AVobjcArr;



/*
1 更新对象  fetchIfNeededInBackgroundWithBlock   todo.fetchWhenSave = true;// 设置 fetchWhenSave 为 true[todo saveInBackground];

 
 
 
 */






+(void)testV;
@end
