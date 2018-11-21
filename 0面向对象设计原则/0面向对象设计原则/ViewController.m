//
//  ViewController.m
//  0面向对象设计原则
//
//  Created by xygj on 2018/11/6.
//  Copyright © 2018 xygj. All rights reserved.
//

#import "ViewController.h"
#import "Original_ChartDisplay.h"
#import "New_DisplayChart.h"

#import "New_LineChart.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self test1];
    
}

// 开闭原则
- (void)test1 {
    [Original_ChartDisplay display:@"pie"];
    [Original_ChartDisplay display:@"bar"];
    
    [New_DisplayChart display:[New_LineChart new]];
}


@end
