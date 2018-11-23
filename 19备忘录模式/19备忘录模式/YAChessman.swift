//
//  YAChessman.swift
//  19备忘录模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

// 原始类
class YAChessman: NSObject {
    var label: String
    var x: Int
    var y: Int
    
    init(label: String, x: Int, y: Int) {
        self.label = label
        self.x = x
        self.y = y
    }
    
    // 保存操作
    func save() -> YAChessmanMemento {
        return YAChessmanMemento(label: label, x: x, y: y)
    }
    
    // 撤销
    func undo(memento: YAChessmanMemento) {
        label = memento.label
        x = memento.x
        y = memento.y
    }
    
}
