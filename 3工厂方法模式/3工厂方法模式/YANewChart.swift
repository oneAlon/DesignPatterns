//
//  YANewChart.swift
//  3工厂方法模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

protocol YANewChartProtocol {
    func display()
}

class YANewPieChart: YANewChartProtocol {
    func display() {
        print("饼状图显示")
    }
}

class YANewLineChart: YANewChartProtocol {
    func display() {
        print("折线图显示")
    }
}
