//
//  ViewController.swift
//  22策略模式
//
//  Created by xygj on 2018/11/26.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 if-else
 输入是固定的格式, 输出也是固定的格式.
 不一样的算法, 将算法封装起来.
 
 实现某一个功能, 有多种途径(算法), 此时可以使用策略设计模式实现灵活的选择解决途径.
 
       Sunny软件公司为某电影院开发了一套影院售票系统，在该系统中需要为不同类型的用户提供不同的电影票打折方式，具体打折方案如下：
             (1) 学生凭学生证可享受票价8折优惠；
             (2) 年龄在10周岁及以下的儿童可享受每张票减免10元的优惠（原始票价需大于等于20元）；
             (3) 影院VIP用户除享受票价半价优惠外还可进行积分，积分累计到一定额度可换取电影院赠送的奖品。
 
 
 
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sellNewMovieTicket()
    }
    
    func sellNewMovieTicket() {
        let newMovieTicket = YANewMovieTicket.init()
        newMovieTicket.price = 100
        print("折后价\(newMovieTicket.getMovieTicketPrice())")
        
        let newStudentMovieTicket = YANewStudentMovieTicket.init()
        newStudentMovieTicket.price = 100
        print("折后价\(newStudentMovieTicket.getMovieTicketPrice())")
        
        let newChildMovieTicket = YANewChildrenMovieTicket.init()
        newChildMovieTicket.price = 100
        print("折后价\(newChildMovieTicket.getMovieTicketPrice())")
    
    }
    
    /*
     存在的问题:
        1. getMovieTicketPrice方法的工作量太大
        2. 如果需要增加新的售票规则, 必须修改YAOldMovieTicket中的代码, 不符合开闭原则
        3. 算法的复用性差
     */
    func sellOldMovieTicket() {
        let oldMovieTicket = YAOldMovieTicket.init()
        oldMovieTicket.price = 100
        
        // 学生票
        oldMovieTicket.type = "student"
        print("折后价\(oldMovieTicket.getMovieTicketPrice())")
        
        // 儿童票
        oldMovieTicket.type = "children"
        print("折后价\(oldMovieTicket.getMovieTicketPrice())")
        
        // vip
        oldMovieTicket.type = "vip"
        print("折后价\(oldMovieTicket.getMovieTicketPrice())")
    }

}

