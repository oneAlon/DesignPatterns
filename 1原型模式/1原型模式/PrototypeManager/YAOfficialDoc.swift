//
//  YAOfficialDoc.swift
//  1原型模式
//
//  Created by 刘君威 on 2019/5/20.
//  Copyright © 2019 OneAlon. All rights reserved.
//

import UIKit

protocol OfficialDocument: NSCopying {
    // 返回克隆后的对象
    func documentCopy() -> OfficialDocument
    func dispaly()
}

// 可行性分析报告(Feasibility Analysis Report)类
class FAR: NSObject, OfficialDocument {
    
    func documentCopy() -> OfficialDocument {
        return self.copy() as! OfficialDocument
    }
    
    func dispaly() {
        print("《可行性分析报告》")
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return FAR()
    }
}

// 软件需求规格说明书(Software Requirements Specification)类
class SRS: NSObject, OfficialDocument {
    
    func documentCopy() -> OfficialDocument {
        return self.copy() as! OfficialDocument
    }
    
    func dispaly() {
        print("《软件需求规格说明书》")
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return SRS()
    }
}

// 新类型文档
class NewDoc: NSObject, OfficialDocument {
    
    func documentCopy() -> OfficialDocument {
        return self.copy() as! NewDoc
    }
    
    func dispaly() {
        print("《新类型文档》")
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        return NewDoc()
    }
}
