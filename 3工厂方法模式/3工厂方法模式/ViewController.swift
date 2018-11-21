//
//  ViewController.swift
//  3工厂方法模式
//
//  Created by xygj on 2018/11/13.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 客户端只需要关心工厂类就可以, 不同的具体工厂创建不同的产品, 返回的类型是YANewChartProtocol
        let chart = YANewPieFactory.createChart()
        chart.display()
        
        // 如果需要新增图表, 只需要创建一个具体图表的工厂类, 不需要修改抽象工厂的源码
        let lineChart = YANewLineFactory.createChart()
        lineChart.display()
        
        
        // 隐藏工厂方法
        YANewPieFactory.displayChart()
    }


}

