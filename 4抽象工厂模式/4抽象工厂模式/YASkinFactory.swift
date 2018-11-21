//
//  YASkinFactory.swift
//  4抽象工厂模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

protocol YASkinFactory {
    static func createButton() -> YASkinComponent
    static func createTextFiled() -> YASkinComponent
    static func createLabel() -> YASkinComponent
}

class YASkinSpringFactory: YASkinFactory {
    
    static func createButton() -> YASkinComponent {
        let button = YASkinSpringButton()
        return button
    }
    
    static func createTextFiled() -> YASkinComponent {
        let textFiled = YASkinSpringTextField()
        return textFiled
    }
    
    static func createLabel() -> YASkinComponent {
        let label = YASkinSpringLabel()
        return label
    }
}

class YASkinSummerFactory: YASkinFactory {
    
    static func createButton() -> YASkinComponent {
        let button = YASkinSummerButton()
        return button
    }
    
    static func createTextFiled() -> YASkinComponent {
        let textFiled = YASkinSummerTextField()
        return textFiled
    }
    
    static func createLabel() -> YASkinComponent {
        let label = YASkinSummerLabel()
        return label
    }
    
}
