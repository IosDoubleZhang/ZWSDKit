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
+(void)AbleStar:(TheCube *)cube andStar:(CubeStar *)Star success:(VoidBlock)success anderror:(StringBlock)fa
{
    AVQuery *priorityQuery = [AVQuery queryWithClassName:@"CubeStar"];
    [priorityQuery whereKey:@"cube" equalTo:Star.cube];
    
    AVQuery *statusQuery = [AVQuery queryWithClassName:@"CubeStar"];
    [statusQuery whereKey:@"user" equalTo:Star.user];
    
    AVQuery *query = [AVQuery andQueryWithSubqueries:[NSArray arrayWithObjects:statusQuery,priorityQuery,nil]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *results, NSError *error) {
        if (error) {
            fa(error.localizedDescription);
        }
        else{
            if (results.count==0) {
                success();
            }
            else{
                fa([NSString stringWithFormat:@"点过赞了"]);
            }
        }
    }];

}
+(void)addStar:(TheCube *)cube andStar:(CubeStar *)Star success:(VoidBlock)success anderror:(StringBlock)fa
{
    [LeanNetBase AbleStar:cube  andStar:Star success:^{
        [LeanNetWork ObjcSaveInBackground:^{
            AVRelation *ar=[cube relationForKey:@"star"];
            [ar  addObject:Star];
            [LeanNetWork ObjcSaveInBackground:^{
                success();
            } faliue:^(NSString *errorMessage) {
                fa(errorMessage);
            } WithObjc:cube];
        } faliue:^(NSString *errorMessage) {
            fa(errorMessage);
        } WithObjc:Star];
    } anderror:^(NSString *parse) {
        fa(parse);
    }];
}
+(void)GetCubeSuccess:(ArrayBlock )success AndError :(StringBlock )Error
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
