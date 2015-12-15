//
//  ITKScaleHeartView.h
//  animations
//
//  Created by liangqi on 15/12/15.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ITKScaleHeartView : UIView

@property(nonatomic,assign) BOOL selected;

+ (instancetype) instance;

- (void) startAnimation;



@end
