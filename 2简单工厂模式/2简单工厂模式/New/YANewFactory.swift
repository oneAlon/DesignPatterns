//
//  YANewFactory.swift
//  2简单工厂模式
//
//  Created by xygj on 2018/11/13.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class YANewFactory: NSObject {
    
    /*
     优点:
        将职责进行分离, 工厂类只负责创建(具体图表的显示功能, 也就是使用, 要去其他类处理)
        工厂类包含了一些必要的逻辑, 可以根据情况创建不同类型的产品实例,
     
     缺点:
        工厂类使用静态方法通过传入的参数创建不同的产品, 如果新加入产品, 就必须修改工厂类的源码, 违反了开闭原则.
        工厂类的职责很重, 如果工厂类不能正常工作, 整个系统都不能正常工作
        扩展困难
        增加了系统中类的个数,增加了复杂度和理解难度
        如果产品类型较多,工厂类中逻辑会更加复杂(if else等)
     */
    class func createChart(byType type: YAChartType) -> YANewChartProtocol {
        var chart: YANewChartProtocol
        switch type {
        case .YAChartTypePie:
            chart = YANewPieChart()
        case .YAChartTypeHistogram:
            chart = YANewHistogramChart()
        case .YAChartTypeLine:
            chart = YANewLineChart()
        }
        return chart
    }

}
