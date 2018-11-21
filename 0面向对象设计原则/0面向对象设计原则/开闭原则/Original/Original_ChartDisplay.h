//
//  Original_ChartDisplay.h
//  0面向对象设计原则
//
//  Created by xygj on 2018/11/6.
//  Copyright © 2018 xygj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Original_ChartDisplay : NSObject

/*
 这里存在一个问题:
    如果现在增加了一种新的图标, 线形图
    Original_ChartDisplay 需要怎么做修改呢?
    Original_ChartDisplay 需要新增一种if else判断, 修改代码.
 */

+ (void)display:(NSString *)displayType;

@end

