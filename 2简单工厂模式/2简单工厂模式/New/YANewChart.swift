//
//  YANewChart.swift
//  2简单工厂模式
//
//  Created by xygj on 2018/11/13.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

// 抽象类(也就是协议)
protocol YANewChartProtocol {
    
    // 绘制
    func draw()
    
    // 擦除
    func erase()
    
    // 也可以使用抽象工厂, 将工厂的类方法写入抽象对象中, 这里不做演示了.
//    static func createNewChart()
}

class YANewPieChart: YANewChartProtocol {
    
    init() {
        print("创建-饼状图")
    }
    
    func draw() {
        print("饼状图-draw")
    }
    
    func erase() {
        print("饼状图-erase")
    }
}

class YANewHistogramChart: YANewChartProtocol {
    
    init() {
        print("创建-柱状图")
    }
    
    func draw() {
        print("柱状图-draw")
    }
    
    func erase() {
        print("柱状图-erase")
    }
}

class YANewLineChart: YANewChartProtocol {
    
    init() {
        print("创建-折线图")
    }
    
    func draw() {
        print("折线图-draw")
    }
    
    func erase() {
        print("折线图-erase")
    }
}
