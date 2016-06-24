//
//  UtilityPopManager.m
//  lifangti
//
//  Created by xthink4 on 16/6/21.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "UtilityPopManager.h"
#import <pop/POP.h>
@implementation UtilityPopManager
+ (void) rotateLayer:(CALayer *)layer to:(CGFloat)toValue {
    
    POPSpringAnimation *anim = [layer pop_animationForKey:@"springRotation"];
    if (anim) {
        anim.toValue = @(toValue);
    } else {
        anim = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerRotation];
        anim.springBounciness = 20.f;
        anim.springSpeed = 20;
        anim.dynamicsTension = 800;
        
        anim.toValue = @(toValue);
        anim.name = @"rotationToState";
        [layer pop_addAnimation:anim forKey:@"springRotation"];
    }
}
+ (void)initailzerAnimationWithToPostion:(CGRect)toRect formPostion:(CGRect)fromRect atView:(UIView *)view beginTime:(CFTimeInterval)beginTime {
    POPSpringAnimation *springAnimation = [POPSpringAnimation animation];
    springAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    springAnimation.removedOnCompletion = YES;
    springAnimation.beginTime = beginTime + CACurrentMediaTime();
    CGFloat springBounciness = 10 - beginTime * 2;
    springAnimation.springBounciness = springBounciness;    // value between 0-20
    
    CGFloat springSpeed = 12 - beginTime * 2;
    springAnimation.springSpeed = springSpeed;     // value between 0-20
    springAnimation.toValue = [NSValue valueWithCGRect:toRect];
    springAnimation.fromValue = [NSValue valueWithCGRect:fromRect];
    
    [view pop_addAnimation:springAnimation forKey:@"POPSpringAnimationKey"];
}
+(void)Alpha:(UIView *)view AlphaValue:(double )Alpha beginTime:(CFTimeInterval)beginTime
{
    POPSpringAnimation *springAnimation = [POPSpringAnimation animation];
    springAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewAlpha];
    springAnimation.removedOnCompletion = YES;
    springAnimation.beginTime = beginTime;
    springAnimation.toValue=@(Alpha);
    [view pop_addAnimation:springAnimation forKey:@"POPSpringAnimation"];
}
@end
