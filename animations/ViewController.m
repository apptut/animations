//
//  ViewController.m
//  animations
//
//  Created by liangqi on 15/12/8.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "ViewController.h"
#import "ITKShapeView.h"
#import "ITKScaleHeartView.h"

@interface ViewController ()
@property(nonatomic,strong) ITKScaleHeartView* heart;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _heart = [ITKScaleHeartView instance];
    _heart.center = self.view.center;
    [self.view addSubview:_heart];
    
}
- (IBAction)start {
    [_heart startAnimation];
}

@end
