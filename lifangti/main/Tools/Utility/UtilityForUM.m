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
+(void)CommonShareTitle:(NSString *)title Info:(NSString *)info Url:(NSString *)Url Img:(UIImage *)img idSelf:(id)Class
{
    [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeImage url:Url];
    [UMSocialData defaultData].extConfig.title = title;
    [UMSocialData defaultData].extConfig.qqData.url = Url;
    [UMSocialSnsService presentSnsIconSheetView:Class
                                         appKey:UMkey
                                      shareText:info
                                     shareImage:img
                                shareToSnsNames:@[UMShareToWechatSession,UMShareToWechatTimeline,UMShareToSina,UMShareToQQ,UMShareToQzone]
                                       delegate:Class];
}
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        //得到分享到的平台名
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}
+(void)WxShareTitle:(NSString *)title Info:(NSString *)info Url:(NSString *)Url Img:(UIImage *)img Location:(CLLocation*)location InfoKindTag:(NSUInteger)InfoKindTag  Kind:(NSInteger )Kind Tag:(NSInteger)tag idSelf:(id)Class
{
    NSArray *tys;
    if (tag==1) {
     
        //调用快速分享接口
        [UMSocialData defaultData].extConfig.wechatTimelineData.title = title;
        [UMSocialData defaultData].extConfig.wechatTimelineData.url= Url;
        tys=@[UMShareToWechatTimeline];
    }
    else{

        [UMSocialData defaultData].extConfig.wechatSessionData.title = title;
        [UMSocialData defaultData].extConfig.wechatSessionData.url = Url;
        tys=@[UMShareToWechatSession];
    }
    
    
    if (Kind==1) {
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeImage;
    }
    else if (Kind==2)
    {
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeText;

    }
    else if (Kind==3)
    {
    [UMSocialData defaultData].extConfig.wxMessageType = UMSocialWXMessageTypeApp;

    }
    else{
        if(InfoKindTag==1)
        {
            
            [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeMusic url:Url];
        }
        else if (InfoKindTag==2)
        {
        [[UMSocialData defaultData].urlResource setResourceType:UMSocialUrlResourceTypeVideo url:Url];
        }
        else
        {
            
        }
    }

    UMSocialUrlResource *urlResource = [[UMSocialUrlResource alloc] initWithSnsResourceType:UMSocialUrlResourceTypeImage url:
                                        Url];
    [[UMSocialDataService defaultDataService]  postSNSWithTypes:tys content:info image:img location:location urlResource:urlResource presentedController:Class completion:^(UMSocialResponseEntity *shareResponse){
        if (shareResponse.responseCode == UMSResponseCodeSuccess) {
            NSLog(@"分享成功！");
        }
    }];
}

@end
