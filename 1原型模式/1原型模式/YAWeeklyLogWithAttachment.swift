//
//  YAWeeklyLogWithAttachment.swift
//  1原型模式
//
//  Created by 刘君威 on 2019/5/20.
//  Copyright © 2019 OneAlon. All rights reserved.
//

import UIKit

 /*
 相关概念:
    1.浅克隆/拷贝: 如果原型对象的成员变量是值类型，将复制一份给克隆对象；如果原型对象的成员变量是引用类型，则将引用对象的地址复制一份给克隆对象，也就是说原型对象和克隆对象的成员变量指向相同的内存地址。
        简单来说，在浅克隆中，当对象被复制时只复制它本身和其中包含的值类型的成员变量，
        而引用类型的成员对象并没有复制
 
    2.深克隆/拷贝:
        在深克隆中，无论原型对象的成员变量是值类型还是引用类型，都将复制一份给克隆对象，
        深克隆将原型对象的所有引用对象也复制一份给克隆对象。简单来说，在深克隆中，
        除了对象本身被复制外，对象所包含的所有成员变量也将复制
 
        实现:
           引用类型对象中也要实现 NSCopying 协议的方法,然后在被克隆对象的 NSCopying 协议方法中调用引用类型属性的 copy() 方法,生成新的对象,再返回
 */

// MARK: - 附件
class Attachment {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func download() {
        print("下载附件,文件名为 \(name)")
    }
}

extension Attachment: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {
        return Attachment(name: self.name)
    }
}

// MARK: - 周报
class YAWeeklyLogWithAttachment: NSObject {
    let attach: Attachment
    var name: String
    var date: String
    var content: String
    
    init(name: String, date: String, content: String, attach: Attachment) {
        self.name = name
        self.date = date
        self.attach = attach
        self.content = content
    }
}

extension YAWeeklyLogWithAttachment: NSCopying {
    func copy(with zone: NSZone? = nil) -> Any {

        /// 浅克隆, 新对象的引用类型属性地址相同
        guard let attach_copy = self.attach.copy() as? Attachment else { return YAWeeklyLogWithAttachment(name: self.name, date: self.date,content: self.content, attach: self.attach) }
        
        return YAWeeklyLogWithAttachment(name: self.name, date: self.date,content: self.content, attach: attach_copy)
        
        /// 深克隆, 对 self.attach (引用类型)单独进行拷贝, 新对象的引用类型属性地址不同
        //  guard let attach_copy = self.attach.copy() as? Attachment else { return YAWeeklyLogWithAttachment(name: self.name, date: self.date,content: self.content, attach: self.attach) }
        //
        //  return YAWeeklyLogWithAttachment(name: self.name, date: self.date,content: self.content, attach: attach_copy)
    }
}
