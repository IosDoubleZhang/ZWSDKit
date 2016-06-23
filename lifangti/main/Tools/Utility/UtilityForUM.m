//
//  UtilityForUM.m
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "UtilityForUM.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"
#import "UMSocialSinaSSOHandler.h"
@implementation UtilityForUM
+(void)StartUm
{
    //设置友盟社会化组件appkey
    [UMSocialData setAppKey:UMkey];
    //设置微信AppId、appSecret，分享url
    [UMSocialWechatHandler setWXAppId:WXKey appSecret:WXAppKey url:ShareUrl];
    //设置手机QQ 的AppId，Appkey，和分享URL，需要#import "UMSocialQQHandler.h"
    [UMSocialQQHandler setQQWithAppId:QQKey appKey:QQAppKey url:ShareUrl];
    //打开新浪微博的SSO开关，设置新浪微博回调地址，这里必须要和你在新浪微博后台设置的回调地址一致。需要 #import "UMSocialSinaSSOHandler.h"
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:SinaKey secret:SinaAppKey RedirectURL:ShareUrl];
}
//+(void)CommonShare:(NSString *)title Url:(NSString *)Url Img:(UIImage *)img
//{
//    [UMSocialData defaultData].extConfig.title = title;
////    [UMSocialData defaultData].extConfig.qqData.url = @"http://baidu.com";
//    [UMSocialSnsService presentSnsIconSheetView:self
//                                         appKey:UMkey
//                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，http://umeng.com/social"
//                                     shareImage:img
//                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
//                                       delegate:self];
//}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
+(void)UmShare:(NSString *)title Url:(NSString *)Url Img:(UIImage *)img
{

}
@end
