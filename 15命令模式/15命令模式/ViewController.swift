//
//  ViewController.swift
//  15命令模式
//
//  Created by xygj on 2018/11/21.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     请求发送者与接收者解耦-命令模式
     
     需求:
        Sunny软件公司开发人员为公司内部OA系统开发了一个桌面版应用程序，该应用程序为用户提供了一系列自定义功能键，用户可以通过这些功能键来实现一些快捷操作。
        Sunny软件公司开发人员通过分析，发现不同的用户可能会有不同的使用习惯，在设置功能键的时候每个人都有自己的喜好，例如有的人喜欢将第一个功能键设置为“打开帮助文档”，
        有的人则喜欢将该功能键设置为“最小化至托盘”，为了让用户能够灵活地进行功能键的设置，开发人员提供了一个“功能键设置”窗口
     
     分析:
        一个按钮可能会关联三个不同的action
        打开帮助文档 最小化托盘 自动截屏 之间没有共同的抽象层, 所以不能抽取父类或者抽象接口
     
        可以创建一个命令类(抽象层), 按钮action(消息发送者)针对命令类(抽象类)编程, 命令类负责将具体的事件转发给消息接收者, 让消息接受者处理事件
        对于按钮action(消息发送者)而言, 不需要知道消息接收者是谁
     
     使用场景:
        1. 需要将请求调用者和请求接收者解耦, 调用者和接收者不直接交互
        2. 请求队列的使用
     
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        OriginalFunctionButton().onClick()
        
//        NewFunctionButton(command: HelpCommand()).onClick()
//        NewFunctionButton(command: CaptureCommand()).onClick()
        
        let command1 = HelpCommand()
        let command2 = HelpCommand()
        let command3 = HelpCommand()
        let functionButton = NewFunctionButton()
        functionButton.addCommand(command1)
        functionButton.addCommand(command2)
        functionButton.addCommand(command3)
        functionButton.deleteCommand(command3)
    }

}

