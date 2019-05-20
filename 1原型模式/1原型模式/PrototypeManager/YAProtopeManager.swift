//
//  YAProtopeManager.swift
//  1原型模式
//
//  Created by 刘君威 on 2019/5/20.
//  Copyright © 2019 OneAlon. All rights reserved.
//

import UIKit

/*
 原型管理器(Prototype Manager)是将多个原型对象存储在一个集合中供客户端使用，
 它是一个专门负责克隆对象的工厂，其中定义了一个集合用于存储原型对象，如果需要某个原型对象的一个克隆，
 可以通过复制集合中对应的原型对象来获得
 */

class YAProtopeManager: NSObject {
    // 单例
    static let `default` = YAProtopeManager()
    private var protoptypeDict: NSMutableDictionary = NSMutableDictionary()
    
    override init() {
        // 增加默认公文对象到字典中
        protoptypeDict.setValue(FAR(), forKey: "far")
        protoptypeDict.setValue(SRS(), forKey: "srs")
    }
    
    // 添加新的公文对象到字典中
    public func addOffocoalDocument(key: String, value: OfficialDocument) {
        protoptypeDict.setValue(value, forKey: key)
    }
    
    //通过浅克隆获取新的公文对象
    public func getOfficialDocument(key: String) -> OfficialDocument {
        let document = protoptypeDict.value(forKey: key) as! OfficialDocument
        return document.documentCopy()
    }
}
