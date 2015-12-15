//
//  ITKShapeView.m
//  animations
//
//  Created by liangqi on 15/12/10.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "ITKShapeView.h"

@interface ITKShapeView()

@property(nonatomic,strong) CAShapeLayer *clayer;

@end

@implementation ITKShapeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void) setup{
    _clayer = [CAShapeLayer layer];
    _clayer.frame = self.bounds;
    _clayer.strokeColor  = [UIColor greenColor].CGColor;
    _clayer.fillColor = [UIColor clearColor].CGColor;
    
    CGPoint center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
    CGFloat lineWith = CGRectGetWidth(self.bounds) / 2 - 2;
    CGFloat radius = CGRectGetWidth(self.bounds) / 2 - lineWith;
    CGFloat start = 0;
    CGFloat end = -M_PI/4;
    
    _clayer.lineWidth = lineWith;
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle: start endAngle:end clockwise:NO];
    
    [path addLineToPoint:center];
    [path closePath];
    
    _clayer.path = path.CGPath;
    [self.layer addSublayer:_clayer];
}

- (void)startAnimation{
    CGPoint center = CGPointMake(CGRectGetWidth(self.bounds)/2, CGRectGetHeight(self.bounds)/2);
    CGFloat lineWith = 2;
    CGFloat radius = CGRectGetWidth(self.bounds) / 2 - lineWith;
    CGFloat start = 0;
    CGFloat end = -M_PI *3 / 2 ;
    
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle: start endAngle:end clockwise:NO];
    [path addLineToPoint:center];
    [path closePath];
    
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"path"];
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    anim.duration = .6f;
    anim.removedOnCompletion = NO;
    self.clayer.path = path.CGPath;
    
    [self.clayer addAnimation:anim forKey:nil];
}


@end
