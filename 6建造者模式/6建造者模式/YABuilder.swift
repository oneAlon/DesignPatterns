//
//  YABuilder.swift
//  6建造者模式
//
//  Created by xygj on 2018/11/27.
//  Copyright © 2018 OneAlon. All rights reserved.
//

import Foundation

// 游戏角色
class YAActor: NSObject {
    
    var type: String = "" // 角色类型
    var sex: String = "" // 性别
    var face: String = "" // 脸型
    var costume: String = "" // 服装
    var hairstyle: String = "" // 发型
    
}


// 抽象构建
protocol YABuilder {
    
    var actor: YAActor { get }
    
    func buildType()
    func buildSex()
    
    // 工厂方法
    func createActor() -> YAActor
    
}

// 具体构建
class YAHeroBuilder: YABuilder {
    var actor: YAActor = YAActor()
    
    func buildType() {
        actor.type = "英雄"
    }
    
    func buildSex() {
        actor.sex = "男"
    }
    
    func createActor() -> YAActor {
        return actor
    }
}


// 指挥者
class YAActorController: NSObject {
    class func construct(builder: YABuilder) -> YAActor {
        builder.buildType()
        builder.buildSex()
        let actor = builder.createActor()
        return actor
    }
}
