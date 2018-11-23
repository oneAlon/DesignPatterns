//
//  ViewController.swift
//  18中介者模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 需求:
    Sunny软件公司欲开发一套图形界面类库。
    该类库需要包含若干预定义的窗格(Pane)对象，例如TextPane、ListPane、GraphicPane等，窗格之间不允许直接引用。
    基于该类库的应用由一个包含一组窗格的窗口(Window)组成，窗口需要协调窗格之间的行为。
    试采用中介者模式设计该系统。
 
 分析:
    可以将window作为中介者, TextPane、ListPane、GraphicPane作为同事类, 同事类之间不相互依赖.
    TextPane选中的时候, 其他的窗格要取消选中, 并且设置TextPane的属性
 
 
 */

class ViewController: UIViewController {
    
    let window = YAPaneWindow()
    let textPane = YATextPane()
    let listPane = YAListPane()
    let grapPane = YAGraphicPane()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        window.textPane = textPane
        window.listPane = listPane
        window.graphicPane = grapPane
        
        textPane.window = window
        listPane.window = window
        grapPane.window = window
    }
    
    
    @IBAction func text(_ sender: Any) {
        textPane.display()
    }
    
    @IBAction func list(_ sender: Any) {
        listPane.display()
    }
    @IBAction func grap(_ sender: Any) {
        grapPane.display()
    }
    @IBAction func button(_ sender: Any) {
        
    }
}



