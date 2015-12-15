//
//  ITKKeyAnimation.h
//  animations
//
//  Created by liangqi on 15/12/9.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef enum
{
    AnimationTypeEaseInQuad = 0,
    AnimationTypeEaseOutQuad,
    AnimationTypeEaseInOutQuad,
    AnimationTypeEaseInCubic,
    AnimationTypeEaseOutCubic,
    AnimationTypeEaseInOutCubic,
    AnimationTypeEaseInQuart,
    AnimationTypeEaseOutQuart,
    AnimationTypeEaseInOutQuart,
    AnimationTypeEaseInQuint,
    AnimationTypeEaseOutQuint,
    AnimationTypeEaseInOutQuint,
    AnimationTypeEaseInSine,
    AnimationTypeEaseOutSine,
    AnimationTypeEaseInOutSine,
    AnimationTypeEaseInExpo,
    AnimationTypeEaseOutExpo,
    AnimationTypeEaseInOutExpo,
    AnimationTypeEaseInCirc,
    AnimationTypeEaseOutCirc,
    AnimationTypeEaseInOutCirc,
    AnimationTypeEaseInElastic,
    AnimationTypeEaseOutElastic,
    AnimationTypeEaseInOutElastic,
    AnimationTypeEaseInBack,
    AnimationTypeEaseOutBack,
    AnimationTypeEaseInOutBack,
    AnimationTypeEaseInBounce,
    AnimationTypeEaseOutBounce,
    AnimationTypeEaseInOutBounce,
    AnimationTypeAll,
    AnimationTypeCount
} AnimationType;


@interface ITKKeyAnimation : CAKeyframeAnimation

+ (instancetype)animationWithKeyPath:(NSString *)path duration:(CGFloat)duration fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue andType:(AnimationType)type;

@end
