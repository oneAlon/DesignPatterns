//
//  YAComponent.swift
//  10装饰模式
//
//  Created by xygj on 2018/12/4.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation


// 基本组件
public class Component {
    public func display() {
        
    }
}

class Window: Component {
    override func display() {
        print("窗口构件显示")
    }
}

class TextBox: Component {
    override func display() {
        print("text构件显示")
    }
}

class ListBox: Component {
    override func display() {
        print("list构件显示")
    }
}
