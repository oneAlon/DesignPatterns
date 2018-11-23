//
//  YAMediator.swift
//  18中介者模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

// 作为抽象中介者
class YAWindow: NSObject {
    
    // 定义一个接口, 用于与各同事类通信
    func paneSelect(pane: YAPane) {
        
    }
    
}

/*
 中介者:
 1. 中转作用
 2. 协调作用
 */
class YAPaneWindow: YAWindow {
    
    // 维持各个同事对象的引用
    var textPane: YATextPane?
    var listPane: YAListPane?
    var graphicPane: YAGraphicPane?
    var buttonPane: YAButtonPane?
    
    // 实现业务逻辑
    override func paneSelect(pane: YAPane) {
        if pane == textPane {
            textPane?.setSelect()
            listPane?.setUnselect()
            graphicPane?.setUnselect()
        }else if pane == self.listPane {
            listPane?.setSelect()
            textPane?.setUnselect()
            graphicPane?.setUnselect()
        }else if pane == self.graphicPane {
            graphicPane?.setSelect()
            listPane?.setUnselect()
            textPane?.setUnselect()
        }
    }
    
}

