//
//  YAWeeklyLog.swift
//  1原型模式
//
//  Created by 刘君威 on 2019/5/20.
//  Copyright © 2019 OneAlon. All rights reserved.
//

import UIKit

class YAWeeklyLog: NSObject {
    var name: String
    var date: String
    var content: String

    init(name: String, date: String, content: String) {
        self.name = name
        self.date = date
        self.content = content
    }
}

// 实现 NSCopying 协议
extension YAWeeklyLog: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return YAWeeklyLog(name: self.name, date: self.date, content: self.content)
    }
}

extension YAWeeklyLog {
    
}
