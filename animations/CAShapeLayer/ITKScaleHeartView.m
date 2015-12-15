//
//  ITKScaleHeartView.m
//  animations
//
//  Created by liangqi on 15/12/15.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "ITKScaleHeartView.h"
#import "ITKKeyAnimation.h"


static NSString* const kAnimation = @"anim";

@interface ITKScaleHeartView()

@property(nonatomic,strong) CALayer* heart;
@property(nonatomic,strong) CALayer* heartLine;
@property(nonatomic,assign) NSInteger animCount;

@end

@implementation ITKScaleHeartView

+ (instancetype)instance{
    return [[self alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
}

- (void)setSelected:(BOOL)selected{
    _selected = selected;
    if (selected) {
        _animCount = 0;
        _heartLine.opacity = 0;
        _heart.opacity = 1;
    } else {
        _heartLine.opacity = 1;
        _heart.opacity = 0;
        _animCount = 1;
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup{
    _heart = [CALayer layer];
    _heart.frame = self.bounds;
    
    _heartLine = [CALayer layer];
    _heartLine.frame = self.bounds;
    
    _animCount = 0;
    
    _heartLine.opacity = 0;
    
    UIImage* img = [UIImage imageNamed:@"heart"];
    _heart.contents = (id)img.CGImage;
    
    UIImage* line = [UIImage imageNamed:@"heart-line"];
    _heartLine.contents = (id)line.CGImage;
    
    [self.layer addSublayer:_heart];
    [self.layer addSublayer:_heartLine];
    
}

- (void) startAnimation{
    
    _animCount++;
    
    NSString* path = @"transform.scale";
    
    [_heartLine removeAllAnimations];
    [_heart removeAllAnimations];
    
    _heartLine.opacity = 1;
    _heart.opacity = 1;
    
    if (_animCount % 2 != 0) {
        CABasicAnimation* outAnim = [CABasicAnimation animationWithKeyPath:path];
        outAnim.duration = .3f;
        outAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        outAnim.fromValue = @1.0;
        outAnim.toValue = @0;
        outAnim.removedOnCompletion = NO;
        outAnim.fillMode = kCAFillModeForwards;
        
        ITKKeyAnimation *anim = [ITKKeyAnimation animationWithKeyPath:path duration:1.6f fromValue:0 toValue:1 andType:AnimationTypeEaseOutElastic];
        [_heartLine addAnimation:anim forKey:kAnimation];
        [_heart addAnimation:outAnim forKey:kAnimation];
        
    } else {
        CABasicAnimation* outAnim = [CABasicAnimation animationWithKeyPath:path];
        outAnim.duration = .3f;
        outAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
        outAnim.fromValue = @1.0;
        outAnim.toValue = @0;
        outAnim.removedOnCompletion = NO;
        outAnim.fillMode = kCAFillModeForwards;
        
        ITKKeyAnimation *anim = [ITKKeyAnimation animationWithKeyPath:path duration:1.6f fromValue:0 toValue:1 andType:AnimationTypeEaseOutElastic];
        
        [_heartLine addAnimation:outAnim forKey:kAnimation];
        [_heart addAnimation:anim forKey:kAnimation];
    
    }
    
    
}

@end
