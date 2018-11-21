//
//  New_DisplayChart.h
//  0面向对象设计原则
//
//  Created by xygj on 2018/11/6.
//  Copyright © 2018 xygj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "New_ChartProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface New_DisplayChart : NSObject

/*
 这样设计:
    如果需要增加新的图形, 只需要让新图形遵循New_ChartProtocol协议, 实现协议的方法就好.
 */

+ (void)display:(id<New_ChartProtocol>)abstractChart;

@end

NS_ASSUME_NONNULL_END
