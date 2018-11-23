//
//  YACHessmanMemento.swift
//  19备忘录模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

// 备忘录, 只负责保存原始类的数据, 原则上来说只有原始类能够访问备忘录
class YAChessmanMemento: NSObject {
    var label: String
    var x: Int
    var y: Int

    init(label: String, x: Int, y: Int) {
        self.label = label
        self.x = x
        self.y = y
    }
}
