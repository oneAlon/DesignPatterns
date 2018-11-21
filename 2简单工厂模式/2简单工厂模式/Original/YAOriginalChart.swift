//
//  YAOriginalChart.swift
//  2简单工厂模式
//
//  Created by xygj on 2018/11/13.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class YAOriginalChart: NSObject {
    
    /*
     存在的问题:
        1. YAOriginalChart是一个巨大的类, 试想如果再增加集中图标类型..
        2. YAOriginalChart类的职责, 违反单一职责原则
        3. 需要增加新的图表时, 需要修改YAOriginalChart类的源码, 违反开闭原则
        4. 创建和使用无法分离, 耦合度高
        5. 在创建图表之前还可能需要做大量的初始化操作, 比如设置颜色等, 在YAOriginalChart类中如果没有一个构造函数的话, 只能交给调用者去设置这些属性, 设置这些属性的代码在客户端, 会出现大量重复代码
     */
    
    var chartType: YAOriginalChartType = .YAOriginalChartPie
    
    init(withType type: YAOriginalChartType){
        switch type {
        case .YAOriginalChartPie:
            print("初始化饼状图")
        case .YAOriginalChartHistogram:
            print("初始化柱状图")
        case .YAOriginalChartLine:
            print("初始化折现图")
        default:
            print("初始化其他")
        }
    }
    
    func display(){
        switch self.chartType{
        case .YAOriginalChartPie:
            print("显示饼状图")
        case .YAOriginalChartHistogram:
            print("显示柱状图")
        case .YAOriginalChartLine:
            print("显示折现图")
        default:
            print("初始化其他")
        }
    }

}
