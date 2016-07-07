//
//  LeanNetBase.m
//  lifangti
//
//  Created by xthink4 on 16/6/29.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "LeanNetBase.h"

@implementation LeanNetBase
+(void)addAComment:(Comment *)Comment toCube:(TheCube *)cube Success:(VoidBlock )success AndError :(StringBlock )Error
{
    [LeanNetWork ObjcSaveInBackground:^{
        AVRelation *ar=[cube relationForKey:@"comment"];
        [ar  addObject:Comment];
        
        [LeanNetWork ObjcSaveInBackground:^{
            success();
        } faliue:^(NSString *errorMessage) {
            Error(errorMessage);
        } WithObjc:cube];
    } faliue:^(NSString *errorMessage) {
              Error(errorMessage);
    } WithObjc:Comment];
}
@end
