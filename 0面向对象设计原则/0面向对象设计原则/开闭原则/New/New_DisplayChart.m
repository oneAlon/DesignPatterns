//
//  New_DisplayChart.m
//  0面向对象设计原则
//
//  Created by xygj on 2018/11/6.
//  Copyright © 2018 xygj. All rights reserved.
//

#import "New_DisplayChart.h"

@implementation New_DisplayChart

+ (void)display:(id<New_ChartProtocol>)abstractChart {
    [abstractChart display];
}

@end
