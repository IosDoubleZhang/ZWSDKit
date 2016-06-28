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
+(void)ObjcSaveInBackground:(void (^)())success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(AVObject*)objc;
///保存一个文件
+(void)FileSavewInBackGround:(void (^)())success faliue:(void (^)(NSString *errorMessage))faliure WithObjc:(AVObject*)objc;







+(void)testV;
@end
