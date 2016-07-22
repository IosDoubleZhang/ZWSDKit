//
//  testClass.m
//  ershou
//
//  Created by xthink4 on 16/7/21.
//  Copyright © 2016年 xxkj. All rights reserved.
//

#import "HttpLinkClass.h"

@implementation HttpLinkClass
+(void)PostLogin:(void(^)(Log*parse))success andError:(StringBlock)faliure With:(NSDictionary *)Objc;
{
    [ZzsNetworkManager postReqeustWithURL:@"http://api.ershouweb.test.xthinkapp.com/v1/user_session" params:Objc successBlock:^(NSDictionary *returnData) {
              [UtilityForData writeLocalFileWithData:returnData with:@"ss"];
        success([Log modelObjectWithDictionary:returnData]);
    } failureBlock:^(NSError *error) {
        faliure(error.localizedDescription);
    } showHUD:NO  WithHeader:NO];
}
+(void)GetUser:(DictionaryBlock)success andError:(StringBlock)faliure
{
    [ZzsNetworkManager getRequstWithURL:@"http://api.ershouweb.test.xthinkapp.com/v1/test/hello_member" params:nil successBlock:^(NSDictionary *returnData) {
        success(returnData);
    } failureBlock:^(NSError *error) {
        faliure(error.localizedDescription);
    } showHUD:NO WithHeader:YES];
}
@end
