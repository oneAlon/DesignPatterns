//
//  ViewController.swift
//  20观察者模式
//
//  Created by xygj on 2018/11/23.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 需求:
    Sunny软件公司欲开发一款多人联机对战游戏（类似魔兽世界、星际争霸等游戏），在该游戏中，多个玩家可以加入同一战队组成联盟，
    当战队中某一成员受到敌人攻击时将给所有其他盟友发送通知，盟友收到通知后将作出响应。
 
 分析:
    使用观察者模式实现
 
 观察者模式:
    包含观察者和观察目标两个层级结构
    Subject观察目标: 被观察的目标, 当状态发生改变时, 向观察者发送通知
    Observer观察者:
 
 iOS中的通知就是使用观察者模式实现的:
    NSNotificationCenter是被观察者, 猜测它内部有一个数组对observer的引用, 当执行post方法时, 就遍历数组获取observer, 调用observer对应的selector
    observer是观察者
 
 iOS中的KVO也是通过观察者模式实现的:
    具体对象(调用addObserver方法的)是被观察者, 当属性的setter方法被调用时, 就通知观察者
    observer是观察者
 
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let center: AllyControlCenter = AllyControlCenter(allyName: "金庸")
        
        print("----------------------------")
        
        let player1 = Player("杨过")
        let player2 = Player("小龙女")
        let player3 = Player("张无忌")
        let player4 = Player("段誉")

        center.join(player: player1)
        center.join(player: player2)
        center.join(player: player3)
        center.join(player: player4)
        
        print("----------------------------")
        
        center.quit(player: player4)
        
        print("----------------------------")
        
        player1.beAttacted(center: center)
        
        
        //        NotificationCenter.default.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
        //        NotificationCenter.default.post(name: <#T##NSNotification.Name#>, object: <#T##Any?#>)
        
//        player1.addObserver(<#T##observer: NSObject##NSObject#>, forKeyPath: <#T##String#>, options: <#T##NSKeyValueObservingOptions#>, context: <#T##UnsafeMutableRawPointer?#>)
        
    }

}

// 目标, 被观察的对象
class AllyControlCenter: NSObject {
    
    var allyName: String
    var players: [Player] = [Player]()
    
    init(allyName: String) {
        print("\(allyName)战队组建成功")
        self.allyName = allyName
    }
    
    func join(player: Player) {
        print("\(player.playerName)加入\(allyName)战队")
        players.append(player)
    }
    
    func quit(player: Player) {
        for (index, item) in players.enumerated() {
            if player.isEqual(item) {
                print("\(player.playerName)离开战队")
                players.remove(at: index)
            }
        }
    }
    
    func notifyObserver(playerName: String) {
        for item in players {
            if playerName != item.playerName {
                // 通知其他观察者
                item.help(name: playerName)
            }
        }
    }
}

// 观察者
class Player: NSObject {
    
    var playerName: String
    
    init(_ name: String) {
        playerName = name
    }
    
    
    func help(name: String){
        print("\(name)坚持住, \(playerName)来救你了")
    }
    
    func beAttacted(center: AllyControlCenter) {
        print("\(playerName)被攻击!")
        // 通知目标, 目标会通知其他观察者.
        center.notifyObserver(playerName: playerName)
    }
}
