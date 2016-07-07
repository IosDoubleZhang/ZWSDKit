//
//  UtilityPopManager.h
//  lifangti
//
//  Created by xthink4 on 16/6/21.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <pop/POP.h>
@interface UtilityPopManager : NSObject

///旋转  例子: M_PI_2/2lifangtiTests Group
+ (void) rotateLayer:(CALayer *)layer to:(CGFloat)toValue ;
///移动 view 从一个位置 到另外的位置 lifangtiTests Group参数 f1 f2 View 动画延迟时间
+(void)initailzerAnimationWithToPostion:(CGRect)toRect formPostion:(CGRect)fromRect atView:(UIView *)view beginTime:(CFTimeInterval)beginTime ;
///view 隐藏动画
+(void)Alpha:(UIView *)view AlphaValue:(double )Alpha beginTime:(CFTimeInterval)beginTime;
@end
