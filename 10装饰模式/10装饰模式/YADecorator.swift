//
//  YADecorator.swift
//  10装饰模式
//
//  Created by xygj on 2018/12/4.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

// 装饰器
class Decorator: Component {
    var component: Component
    
    init(component: Component) {
        self.component = component
    }
}

class ScrollBarDecorator: Decorator {
    
    override func display() {
        setScrollBar()
        component.display()
    }
    
    func setScrollBar() {
        print("为组件增加滚动条!")
    }
    
}
