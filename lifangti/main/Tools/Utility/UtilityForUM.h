//
//  UtilityForUM.h
//  lifangti
//
//  Created by xthink4 on 16/6/20.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UMSocial.h>
#define UMkey       @"576914d3e0f55aa891000ec1"

#define WXKey       @"wx23a8767d318ea2f3"
#define WXAppKey    @"aea3e424741ddabd81f9e94dafd1910f"

#define QQKey       @"wxd930ea5d5a258f4f"
#define QQAppKey    @"db426a9829e4b49a0dcac7b4162da6b6"

#define SinaKey     @"wxd930ea5d5a258f4f"
#define SinaAppKey  @"db426a9829e4b49a0dcac7b4162da6b6"

#define ShareUrl    @"http://www.umeng.com/social"
@interface UtilityForUM : NSObject<UMSocialUIDelegate>
///配置友盟的key 还有启动的服务
+(void)StartUm;
///基本分享形式
+(void)CommonShareTitle:(NSString *)title Info:(NSString *)info Url:(NSString *)Url Img:(UIImage *)img idSelf:(id)Class;
///分享到微信 tag 1朋友圈 其他 微信好友 kind=1纯图片 k=2 纯文字 k=3 app  InfoKindTag1 音乐 2视频
+(void)WxShareTitle:(NSString *)title Info:(NSString *)info Url:(NSString *)Url Img:(UIImage *)img Location:(CLLocation*)location  InfoKindTag:(NSUInteger)InfoKindTag  Kind:(NSInteger )Kind  Tag:(NSInteger)tag  idSelf:(id)Class;
@end
