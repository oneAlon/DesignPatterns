//
//  ViewController.swift
//  2简单工厂模式
//
//  Created by xygj on 2018/11/13.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 工厂模式分为: 1.简单工厂模式 2.工厂方法模式 3.抽象工厂模式
 
 需求:
    Sunny软件公司欲基于Java语言开发一套图表库，该图表库可以为应用系统提供各种不同外观的图表，例如柱状图、饼状图、折线图等。
    Sunny软件公司图表库设计人员希望为应用系统开发人员提供一套灵活易用的图表库，而且可以较为方便地对图表库进行扩展，以便能够在将来增加一些新类型的图表。
 
 方案分析:
    原始方案
    简单工厂方案
 
 使用场景:
    1. 工厂类创建的对象比较少, 不会存在太复杂的逻辑
    2. 客户端只知道传入工厂类的参数, 对如何创建对象不关心.
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        // MARK: - 原始模式
        let pieChart = YAOriginalChart(withType: .YAChartTypePie)
        pieChart.display()
        
        // MARK: - 简单工厂模式
        let pieChart2 = YANewFactory.createChart(byType: .YAChartTypePie)
        pieChart2.draw()

    }

}


