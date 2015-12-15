//
//  ITKKeyAnimation.m
//  animations
//
//  Created by liangqi on 15/12/9.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "ITKKeyAnimation.h"
#import "NSBKeyframeAnimationFunctions.h"

// 每秒运动60帧保证动画整体流畅
#define kFPS 60

@interface ITKKeyAnimation()
@property(nonatomic,assign) NSBKeyframeAnimationFunction animateFunc;
@end

@implementation ITKKeyAnimation

+ (instancetype)animationWithKeyPath:(NSString *)path duration:(CGFloat)duration fromValue:(CGFloat)fromValue toValue:(CGFloat)toValue andType:(AnimationType)type{
    
    ITKKeyAnimation* animate =  [self animationWithKeyPath:path];
    animate.animateFunc = [self animateFunc:type];
    animate.duration = duration;
    animate.values = [animate getAnimateValuesfromValue:fromValue toValue:toValue animateType:type];
    return  animate;
}


- (NSArray *) getAnimateValuesfromValue:(CGFloat)fromValue toValue:(CGFloat)toValue animateType:(AnimationType) type{
    
    
    // 计算运行的步数
    NSUInteger steps = (NSUInteger)ceil(kFPS * self.duration) + 2;
    NSMutableArray *valueArray = [NSMutableArray arrayWithCapacity:steps];
    
    const double increment = 1.0 / (double)(steps - 1);
    double progress = 0.0,
    v = 0.0,
    value = 0.0;
    
    NSUInteger i;
    for (i = 0; i < steps; i++)
    {
        v = _animateFunc(self.duration * progress * 1000, 0, 1, self.duration * 1000);
        value = fromValue + v * (toValue - fromValue);
        [valueArray addObject:@(value)];
        progress += increment;
    }
    
    return [NSArray arrayWithArray:valueArray];
}

+ (NSBKeyframeAnimationFunction) animateFunc:(AnimationType) type{
    switch (type)
    {
        case AnimationTypeEaseInQuad:
            return NSBKeyframeAnimationFunctionEaseInQuad;
        case AnimationTypeEaseOutQuad:
            return NSBKeyframeAnimationFunctionEaseOutQuad;
        case AnimationTypeEaseInOutQuad:
            return NSBKeyframeAnimationFunctionEaseInOutQuad;
        case AnimationTypeEaseInCubic:
            return NSBKeyframeAnimationFunctionEaseInCubic;
        case AnimationTypeEaseOutCubic:
            return NSBKeyframeAnimationFunctionEaseOutCubic;
        case AnimationTypeEaseInOutCubic:
            return NSBKeyframeAnimationFunctionEaseInOutCubic;
        case AnimationTypeEaseInQuart:
            return NSBKeyframeAnimationFunctionEaseInQuart;
        case AnimationTypeEaseOutQuart:
            return NSBKeyframeAnimationFunctionEaseOutQuart;
        case AnimationTypeEaseInOutQuart:
            return NSBKeyframeAnimationFunctionEaseInOutQuart;
        case AnimationTypeEaseInQuint:
            return NSBKeyframeAnimationFunctionEaseInQuint;
        case AnimationTypeEaseOutQuint:
            return NSBKeyframeAnimationFunctionEaseOutQuint;
        case AnimationTypeEaseInOutQuint:
            return NSBKeyframeAnimationFunctionEaseInOutQuint;
        case AnimationTypeEaseInSine:
            return NSBKeyframeAnimationFunctionEaseInSine;
        case AnimationTypeEaseOutSine:
            return NSBKeyframeAnimationFunctionEaseOutSine;
        case AnimationTypeEaseInOutSine:
            return NSBKeyframeAnimationFunctionEaseInOutSine;
        case AnimationTypeEaseInExpo:
            return NSBKeyframeAnimationFunctionEaseInExpo;
        case AnimationTypeEaseOutExpo:
            return NSBKeyframeAnimationFunctionEaseOutExpo;
        case AnimationTypeEaseInOutExpo:
            return NSBKeyframeAnimationFunctionEaseInOutExpo;
        case AnimationTypeEaseInCirc:
            return NSBKeyframeAnimationFunctionEaseInCirc;
        case AnimationTypeEaseOutCirc:
            return NSBKeyframeAnimationFunctionEaseOutCirc;
        case AnimationTypeEaseInOutCirc:
            return NSBKeyframeAnimationFunctionEaseInOutCirc;
        case AnimationTypeEaseInElastic:
            return NSBKeyframeAnimationFunctionEaseInElastic;
        case AnimationTypeEaseOutElastic:
            return NSBKeyframeAnimationFunctionEaseOutElastic;
        case AnimationTypeEaseInOutElastic:
            return NSBKeyframeAnimationFunctionEaseInOutElastic;
        case AnimationTypeEaseInBack:
            return NSBKeyframeAnimationFunctionEaseInBack;
        case AnimationTypeEaseOutBack:
            return NSBKeyframeAnimationFunctionEaseOutBack;
        case AnimationTypeEaseInOutBack:
            return NSBKeyframeAnimationFunctionEaseInOutBack;
        case AnimationTypeEaseInBounce:
            return NSBKeyframeAnimationFunctionEaseInBounce;
        case AnimationTypeEaseOutBounce:
            return NSBKeyframeAnimationFunctionEaseOutBounce;
        case AnimationTypeEaseInOutBounce:
            return NSBKeyframeAnimationFunctionEaseInOutBounce;
        default:
            return NULL;
    }
    
    return NULL;
}

@end
