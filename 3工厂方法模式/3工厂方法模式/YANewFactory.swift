//
//  YANewFactory.swift
//  3工厂方法模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 工厂方法模式:
    将具体产品的创建交给具体的工厂类, 这种修改可以在不修改具体工厂类的情况下引进新的产品
    如果增加新的产品, 只需要增加具体产品和对应的工厂类就可以
    这就是相对于简单工厂的优化点, 更加符合开闭原则.
 
 优点:
    工厂方法封装了创建产品和配置产品的细节, 客户端只需要关心所需产品对应的工厂, 而不需要关心需要产品的类名.
    加入新产品时不需要修改抽象工厂和抽象产品提供的接口, 符合开闭原则
 
 缺点:
    由于系统扩展性的考虑, 需要增加抽象层, 客户端代码均针对抽象层进行编码, 增加系统的抽象性和理解难度
    需要增加新产品时需要编写新产品的源码, 还需要增加新产品对应的工厂, 代码中类的个数增多
 
 */


/// 抽象类, 协议
protocol YANewFactoryProtocol {
    // 创建图表, 当客户端拿到这个创建好的图表时是一个已经经过初始化配置的图表
    static func createChart() -> YANewChartProtocol
    
    // 有时候也可以隐藏工厂方法
    // 子类工厂直接调用具体产品的方法,在客户端就直接调用该子类工厂的这个方法,不需要调用具体产品的方法
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
    
    // 隐式创建
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
    
    // 隐式创建
    static func displayChart() {
        let chart = createChart()
        chart.display()
    }
}
