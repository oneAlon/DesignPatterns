//
//  YANewFile.swift
//  15命令模式
//
//  Created by xygj on 2018/11/21.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

/*
 如果修改NewFunctionButton的onClick方法, 只需要增加具体的命令类和消息接收者就可以了, 不需要修改消息发送者的源码
 */

// 消息发送者
class NewFunctionButton {
    
    var commandsArray:[Command] = [Command]()
    var command: Command
    
    init(command: Command) {
        self.command = command
    }
    
    func addCommand(_ command: Command) {
        commandsArray.append(command)
    }
    
    func deleteCommand(_ command: Command) {
        
        for (index, item) in commandsArray.enumerated() {
            if command.isEqual(item) {
                commandsArray.remove(at: index)
            }
        }
        print(commandsArray)
    }
    
    func onClick() {
        command.execute()
    }
}

// 抽象命令类
protocol Command: NSObjectProtocol {
    func execute()
}

// 具体命令类
class HelpCommand: NSObject, Command {
    
    let helpHander = HelpHandler()
    
    func execute() {
        helpHander.display()
    }
}

class CaptureCommand: NSObject, Command {

    let capture = ScreenCapture()

    func execute() {
        capture.capture()
    }
}

// 消息接收者
class HelpHandler {
    func display() {
        print("打开帮助文档")
    }
}

class ScreenCapture {
    func capture() {
        print("自动截屏")
    }
}
