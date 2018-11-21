//
//  Original_ChartDisplay.m
//  0面向对象设计原则
//
//  Created by xygj on 2018/11/6.
//  Copyright © 2018 xygj. All rights reserved.
//

#import "Original_ChartDisplay.h"
#import "Original_PinChart.h"
#import "Original_BarChart.h"

@implementation Original_ChartDisplay

+ (void)display:(NSString *)displayType {
    if ([displayType isEqualToString:@"pie"]) {
        [Original_PinChart display];
    }else if([displayType isEqualToString:@"bar"]){
        [Original_BarChart display];
    }
}

@end
