//
//  ViewController.swift
//  6建造者模式
//
//  Created by OneAlon on 2018/11/14.
//  Copyright © 2018 OneAlon. All rights reserved.
//

import UIKit

/*
 
 需求:
    Sunny软件公司游戏开发小组决定开发一款名为《Sunny群侠传》的网络游戏，该游戏采用主流的RPG(Role Playing Game,角色扮演游戏)模式，玩家可以在游戏中扮演虚拟世界中的一个特定角色，角色根据不同的游戏情节和统计数据（如力量、魔法、技能等）具有不同的能力，角色也会随着不断升级而拥有更加强大的能力。
    作为RPG游戏的一个重要组成部分，需要对游戏角色进行设计，而且随着该游戏的升级将不断增加新的角色。不同类型的游戏角色，其性别、脸型、服装、发型等外部特性都有所差异，例如“天使”拥有美丽的面容和披肩的长发，并身穿一袭白裙；而“恶魔”极其丑陋，留着光头并穿一件刺眼的黑衣。
    Sunny公司决定开发一个小工具来创建游戏角色，可以创建不同类型的角色并可以灵活增加新的角色
 
 分析:
    建造者模式
 
 建造者模式:
    复杂对象的创建, 一步步构建一个包含多个组成部件的完整对象, 使用相同的构建过程构建不同的产品.
    在建造者模式中, 客户端只需要实例化指挥者类, 传入想要实例化哪种产品类型
 
 建造者中的几个角色:
    1. 抽象建造者: Builder, 提供产品对象的各个构建接口, 再提供一个返回产品对象的接口(组建完对象以后需要返回给客户端使用)
    2. 具体建造者: HexoBuilder, 实现抽象建造者中定义的接口
    3. 产品角色: Actor, 可以理解为model, 存储属性
    4. 指挥者: ActorController, 提供一个构建方法, 在构建方法中调用建造者的构建接口(可能会有很多个接口), 将构建完成的产品返回给客户端使用, 客户端只针对指挥者编程, 不需要知道具体产品和
 
 优点:
    1. 客户端不需要知道产品的组建细节, 将产品本身和产品的创建过程解耦, 相同的创建过程c可以创建不同的产品
    2. 具体的建造者创建具体的产品, 如果新增加产品不需要修改抽象建造者, 符合开闭原则
    3. 可以在指挥者中方便控制产品的创建过程(如果没有指挥者, 那么产品的创建过程会分布在客户端的多个地方, 代码重复, 修改起来比较麻烦)
 
 缺点:
    1. 建造者创建的产品一般都有较多的共同点, 组成一般都比较相似
    2. 如果具体产品种类多, 就会造成系统的类数量增加, 造成系统的理解难度和运行成本
 
 练习:
    Sunny软件公司欲开发一个视频播放软件，为了给用户使用提供方便，该播放软件提供多种界面显示模式，如完整模式、精简模式、记忆模式、网络模式等。
    在不同的显示模式下主界面的组成元素有所差异，如在完整模式下将显示菜单、播放列表、主窗口、控制条等，
    在精简模式下只显示主窗口和控制条，而在记忆模式下将显示主窗口、控制条、收藏列表等。尝试使用建造者模式设计该软件。
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let actor = YAActorController.construct(builder: YAHeroBuilder())
        print("游戏角色:\(actor.type)")
        print("性别:\(actor.sex)")
        
        let hexoActor = YAActorController.constructHexo()
        print("游戏角色:\(hexoActor.type)")
        print("性别:\(hexoActor.sex)")
        
        // 省略指挥者类
        let actor2 = YAActor.construct(builder: YAHeroBuilder())
        print("游戏角色:\(actor2.type)")
        print("性别:\(actor2.sex)")
        
        
        // MARK: - 视频播放显示模式练习
        print("\n**** 视频播放显示模式练习 ****\n")
        // 完整模式
        let allVideo = YAVideoController.construct(videoBuilder: YAAllVideoBuilder())
        print("是否显示菜单:\(allVideo.menu)")
        print("是否显示播放列表:\(allVideo.displayList)")
        print("是否显示主窗口:\(allVideo.homeWindow)")
        print("是否显示控制条:\(allVideo.controlLine)")
        print("是否显示收藏列表:\(allVideo.collectionList)\n")
        
        // 精简模式
        let simpleVideo = YAVideoController.construct(videoBuilder: YASimpleVideoBuilder())
        print("是否显示菜单:\(simpleVideo.menu)")
        print("是否显示播放列表:\(simpleVideo.displayList)")
        print("是否显示主窗口:\(simpleVideo.homeWindow)")
        print("是否显示控制条:\(simpleVideo.controlLine)")
        print("是否显示收藏列表:\(simpleVideo.collectionList)")
    }
}

extension ViewController {
    
}
