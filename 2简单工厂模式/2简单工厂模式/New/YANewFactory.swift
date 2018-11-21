//
//  YANewFactory.swift
//  2简单工厂模式
//
//  Created by xygj on 2018/11/13.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class YANewFactory: NSObject {
    
    enum chartError: Error {
        case UnSupportedShapeException
    }
    
    /*
     优点:
        将职责进行分离, 工厂类只负责创建(具体图表的显示功能, 也就是使用, 要去其他类处理)
        工厂类包含了一些必要的逻辑, 可以根据情况创建不同类型的产品实例,
     
     缺点:
        工厂类使用静态方法通过传入的参数创建不同的产品, 如果新加入产品, 就必须修改工厂类的源码, 违反了开闭原则.
     */
    class func getChart(withType type: YAOriginalChartType) throws -> YANewChartProtocol {
        var chart: YANewChartProtocol
        switch type {
        case .YAOriginalChartPie:
            chart = YANewPieChart()
        case .YAOriginalChartHistogram:
            chart = YANewHistogramChart()
        case .YAOriginalChartLine:
            chart = YANewLineChart()
        case .YAOriginalChartUnKnow:
            throw chartError.UnSupportedShapeException
        }
        return chart
    }

}
