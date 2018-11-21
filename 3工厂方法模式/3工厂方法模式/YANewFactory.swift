//
//  YANewFactory.swift
//  3工厂方法模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 优点:
    工厂方法封装了创建产品和配置产品的细节, 客户端只需要关心所需产品对应的工厂, 而不需要关心需要产品的类名.
    加入新产品时不需要修改抽象工厂和抽象产品提供的接口, 符合开闭原则
 
 缺点:
    需要增加新产品d时需要编写新产品的源码, 还需要增加新产品对应的工厂, 代码中类的个数增多
 */


/// 抽象类, 协议
protocol YANewFactoryProtocol {
    // 创建图表, 当客户端拿到d这个创建好的图表时是一个已经经过初始化配置的图表
    static func createChart() -> YANewChartProtocol
    
    // 有时候也可以隐藏工厂方法
    static func displayChart()
}


/// 饼状图
class YANewPieFactory: YANewFactoryProtocol {

    static func createChart() -> YANewChartProtocol {
        let chart = YANewPieChart()
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        return chart
    }
    
    static func displayChart() {
        let chart = createChart()
        chart.display()
    }
    
}


/// 折线图
class YANewLineFactory: YANewFactoryProtocol {
    
    static func createChart() -> YANewChartProtocol {
        let chart = YANewLineChart()
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        // 进行图表的一些初始化配置... 代码省略
        return chart
    }
    
    static func displayChart() {
        let chart = createChart()
        chart.display()
    }
}
