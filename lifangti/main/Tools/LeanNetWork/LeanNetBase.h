//
//  LeanNetBase.h
//  lifangti
//
//  Created by xthink4 on 16/6/29.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Comment;
@class TheCube;
@class CubeImg;
@class CubeStar;
@interface LeanNetBase : NSObject
+(void)addAComment:(Comment *)Comment toCube:(TheCube *)cube Success:(VoidBlock )success AndError :(StringBlock )Error;
+(void)GetCubeSuccess:(ArrayBlock )success AndError :(StringBlock )Error;
+(void)addAcube:(TheCube *)cube andimg:(CubeImg *)img success:(VoidBlock)success anderror:(VoidBlock)error;
+(void)addStar:(TheCube *)cube andStar:(CubeStar *)Star success:(VoidBlock)success anderror:(StringBlock)fa;
+(void)AbleStar:(TheCube *)cube andStar:(CubeStar *)Star success:(VoidBlock)success anderror:(StringBlock)fa;


@end
