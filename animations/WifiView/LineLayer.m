//
//  LineLayer.m
//  animations
//
//  Created by liangqi on 15/12/9.
//  Copyright © 2015年 dailyios. All rights reserved.
//

#import "LineLayer.h"
#import <UIKit/UIKit.h>

@implementation LineLayer

@synthesize progress;

+ (BOOL)needsDisplayForKey:(NSString *)key{
    if ([key isEqualToString:@"progress"]) {
        
        return YES;
    }
    return [super needsDisplayForKey: key];
}


- (void)drawInContext:(CGContextRef)ctx{
    
    NSLog(@"%f",self.progress);
    
    // self.path = path.CGPath;
}

@end
