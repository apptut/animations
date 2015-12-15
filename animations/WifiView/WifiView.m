//
//  WifiView.m
//  animations
//
//  Created by liangqi on 15/12/8.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "WifiView.h"
#import "ITKKeyAnimation.h"
#import "LineLayer.h"


#define kDefaultFillColor [UIColor colorWithRed:88/255.0f green:147/255.0f blue:183/255.0f alpha:1]
#define kDefaultSize CGRectMake(0, 0, 100, 100)


// 内部圆点配置参数
#define kCircleSize 10

// 弧线宽度
static const CGFloat kRadianWidth = 5.0f;

@interface WifiView()

// 内部是新圆点

@property(nonatomic,strong) CALayer *circle;
@property(nonatomic,strong) CAShapeLayer *lineFirst;
@property(nonatomic,strong) CAShapeLayer *lineSecond;
@property(nonatomic,strong) CAShapeLayer *lineThird;

@property(nonatomic,strong) LineLayer *testLayer;

@end

@implementation WifiView

+ (instancetype)instance{
    return [[self alloc] initWithFrame:kDefaultSize];
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
    [self drawView];
}

- (void) drawView{
    
    // global config
    CGFloat width = self.bounds.size.width;
    
    // 第一条弧线
    CGFloat radius = 15.0f;
    CGFloat start = 5 * M_PI / 4;
    CGFloat end = 7 * M_PI / 4;
    _lineFirst = [CAShapeLayer new];
    _lineFirst.frame = CGRectMake(CGRectGetWidth(kDefaultSize)/2 - radius, CGRectGetWidth(kDefaultSize)/2 - radius, radius * 2, radius * 2);
    
    CGPoint center = CGPointMake(radius, radius);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:(radius * 2 - kRadianWidth)/2 startAngle:start endAngle:end clockwise:YES];
    
    _lineFirst.path = path.CGPath;
    _lineFirst.fillColor = [UIColor clearColor].CGColor;
    _lineFirst.strokeColor = kDefaultFillColor.CGColor;
    _lineFirst.lineCap = kCALineCapRound;
    _lineFirst.lineWidth = kRadianWidth;

    [self.layer addSublayer:_lineFirst];
    
    
    // 第二条弧线
    CGFloat radiusSecond = 25.0f;
    CGFloat radiusSecDiameter = radiusSecond * 2;
    CGFloat secondCenter = (width - radiusSecDiameter)/2;
    CGPoint secPathCenter = CGPointMake(radiusSecond, radiusSecond);
    
    UIBezierPath *secPath = [UIBezierPath bezierPathWithArcCenter:secPathCenter radius:(radiusSecDiameter - kRadianWidth) / 2 startAngle:start endAngle:end clockwise:YES];
    
    _lineSecond = [CAShapeLayer new];
    _lineSecond.fillColor = [UIColor clearColor].CGColor;
    _lineSecond.strokeColor = kDefaultFillColor.CGColor;
    _lineSecond.lineWidth = kRadianWidth;
    _lineSecond.frame = CGRectMake(secondCenter, secondCenter, radiusSecDiameter, radiusSecDiameter);
    _lineSecond.path = secPath.CGPath;
    _lineSecond.lineCap = kCALineCapRound;
    [self.layer addSublayer:_lineSecond];
    
    CGFloat radiusThird = 35.0f;
    CGFloat radiusThirdDiameter = radiusThird * 2;
    CGFloat thirdCenter = (width - radiusThirdDiameter)/2;
    CGPoint thirdPathCenter = CGPointMake(radiusThird, radiusThird);
    
    UIBezierPath *thirdPath = [UIBezierPath bezierPathWithArcCenter:thirdPathCenter radius:(radiusThirdDiameter - kRadianWidth) / 2 startAngle:start endAngle:end clockwise:YES];
    
    _lineThird = [CAShapeLayer new];
    _lineThird.fillColor = [UIColor clearColor].CGColor;
    _lineThird.strokeColor = kDefaultFillColor.CGColor;
    _lineThird.lineWidth = kRadianWidth;
    _lineThird.frame = CGRectMake(thirdCenter, thirdCenter, radiusThirdDiameter, radiusThirdDiameter);
    _lineThird.path = thirdPath.CGPath;
    _lineThird.lineCap = kCALineCapRound;
    [self.layer addSublayer:_lineThird];
    
    // 画实心圆
    _circle = [CALayer new];
    _circle.frame = CGRectMake((CGRectGetWidth(kDefaultSize) - kCircleSize) / 2, (CGRectGetHeight(kDefaultSize) - kCircleSize) / 2, kCircleSize, kCircleSize);
    _circle.cornerRadius = kCircleSize / 2;
    _circle.backgroundColor = kDefaultFillColor.CGColor;
    [self.layer addSublayer:_circle];
    
}

- (void)startAnimation{
    
    CAAnimationGroup* group = [self getAnimations:0];
    CAAnimationGroup* secGroup = [self getAnimations:0.15f];
    CAAnimationGroup* thirdGroup = [self getAnimations:0.25f];
    
    [_lineThird addAnimation:group forKey:nil];
    [_lineSecond addAnimation:secGroup forKey:nil];
    [_lineFirst addAnimation:thirdGroup forKey:nil];
    
}


- (CAAnimationGroup *)getAnimations:(CGFloat)delay{
    CAMediaTimingFunction* func = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *firstAnimation = [CABasicAnimation animation];
    firstAnimation.keyPath = @"transform.rotation";
    //firstAnimation.fromValue = @(7*M_PI/4);
    firstAnimation.beginTime = delay;
    firstAnimation.byValue = @(-M_PI/4);
    firstAnimation.duration = 0.2f;
    firstAnimation.timingFunction = func;
    firstAnimation.removedOnCompletion = NO;
    firstAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *secondAnimation = [CABasicAnimation animation];
    secondAnimation.keyPath = @"transform.rotation";
    secondAnimation.beginTime = delay + 0.2f;
    //firstAnimation.fromValue = @(7*M_PI/4);
    secondAnimation.byValue = @(M_PI/2);
    secondAnimation.duration = 0.4f;
    secondAnimation.timingFunction = func;
    secondAnimation.removedOnCompletion = NO;
    secondAnimation.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *thirdAnimation = [CABasicAnimation animation];
    thirdAnimation.keyPath = @"transform.rotation";
    thirdAnimation.beginTime = delay + 0.6f;
    thirdAnimation.byValue = @(-M_PI/4);
    thirdAnimation.duration = 0.2f;
    thirdAnimation.timingFunction = func;
    thirdAnimation.removedOnCompletion = NO;
    thirdAnimation.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup* group = [CAAnimationGroup animation];
    group.animations = @[firstAnimation,secondAnimation,thirdAnimation];
    group.duration = 0.8f + delay;
    //group.repeatCount = INFINITY;
    
    //group.removedOnCompletion = NO;
    //group.fillMode = kCAFillModeForwards;
    //group.repeatCount = INFINITY;
    
    return group;
}



@end
