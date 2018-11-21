//
//  YAOriginalFile.swift
//  15命令模式
//
//  Created by xygj on 2018/11/21.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

/*
 存在的问题:
    发送者和接收者耦合严重, 如果要更换接收者就必须修改源码
 */

// FunctionButton是请求发送者
class OriginalFunctionButton {
    lazy var originalHelpHandler: OriginalHelpHandler = {
        OriginalHelpHandler()
    }()
    
    lazy var originalCapture: OriginalScreenCapture = {
        OriginalScreenCapture()
    }()
    
    func onClick() {
        // 如果要修改按钮的点击事件, 就必须修改这里的实现
//        originalHelpHandler.display()
        originalCapture.capture()
    }
}

// HelpHandler是事件接收者
class OriginalHelpHandler {
    func display() {
        print("打开帮助文档")
    }
}

class OriginalScreenCapture {
    func capture() {
        print("自动截屏")
    }
}
