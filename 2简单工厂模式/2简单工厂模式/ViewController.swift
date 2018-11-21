//
//  ViewController.swift
//  2简单工厂模式
//
//  Created by xygj on 2018/11/13.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         工厂模式分为: 1.简单工厂模式 2.工厂方法模式 3.抽象工厂模式

         需求: 开发一个工具, 生成不同形状的图表, 如柱状图 饼状图 折线图
         */

        // MARK: - 原始模式
        let pieChart = YAOriginalChart(withType: .YAOriginalChartPie)
        pieChart.display()
        
        // MARK: - 简单工厂模式
        do {
            let pieChart2 = try YANewFactory.getChart(withType: .YAOriginalChartUnKnow)
            pieChart2.display()
        } catch{
            print("捕获到错误信息")
            return
        }

    }

}


