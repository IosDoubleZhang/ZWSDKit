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
}+(void)GetCubeSuccess:(ArrayBlock )success AndError :(StringBlock )Error
{
    AVQuery *query = [AVQuery queryWithClassName:@"TheCube"];
    [query orderByDescending:@"createdAt"];
    query.cachePolicy = kAVCachePolicyNetworkElseCache;

    //设置缓存有效期
    query.maxCacheAge = 24*3600;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            Error(error.localizedDescription);
        }
        else{
            success(objects);
        }
    }];
}

+(void)addAcube:(TheCube *)cube andimg:(CubeImg *)img success:(VoidBlock)success anderror:(VoidBlock)error
{
    [LeanNetWork ObjcSaveInBackground:^{
        AVRelation *ar=[cube relationForKey:@"img"];
        [ar  addObject:img];
        [LeanNetWork ObjcSaveInBackground:^{
            success();
        } faliue:^(NSString *errorMessage) {
            error();
        } WithObjc:cube];
    } faliue:^(NSString *errorMessage) {
        error();
    } WithObjc:img];
    
    
}
@end
