//
//  testClass.h
//  ershou
//
//  Created by xthink4 on 16/7/21.
//  Copyright © 2016年 xxkj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZzsNetwrok.h"
#import "Log.h"
@interface HttpLinkClass : NSObject
+(void)PostLogin:(void(^)(Log*parse))success andError:(StringBlock)faliure With:(NSDictionary *)Objc;
+(void)GetUser:(DictionaryBlock)success andError:(StringBlock)faliure;
@end
