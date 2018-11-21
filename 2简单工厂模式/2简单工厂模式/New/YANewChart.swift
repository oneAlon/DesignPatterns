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
    
    func display()
    func draw()
    func erase()
}

class YANewPieChart: YANewChartProtocol {
    
    init() {
        print("创建-饼状图")
    }
    
    func display() {
        print("显示-饼状图")
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
    
    func display() {
        print("显示-柱状图")
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
    
    func display() {
        print("显示-折线图")
    }
    
    func draw() {
        print("折线图-draw")
    }
    
    func erase() {
        print("折线图-erase")
    }
}
