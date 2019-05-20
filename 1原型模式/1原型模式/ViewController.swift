//
//  ViewController.swift
//  1原型模式
//
//  Created by OneAlon on 2018/11/12.
//  Copyright © 2018 OneAlon. All rights reserved.
//

import UIKit

/*
 目的:
    通过一个原型对象克隆出多个一模一样的对象.
 
 优点:
    1.当创建新的对象实例较为复杂时，使用原型模式可以简化对象的创建过程，
      通过复制一个已有实例可以提高新实例的创建效率.
    2.扩展性较好，由于在原型模式中提供了抽象原型类，
      在客户端可以针对抽象原型类进行编程，而将具体原型类写在配置文件中，
      增加或减少产品类对原有系统都没有任何影响.
    3.原型模式提供了简化的创建结构，
      工厂方法模式常常需要有一个与产品类等级结构相同的工厂等级结构，
      而原型模式就不需要这样，原型模式中产品的复制是通过封装在原型类中的克隆方法实现的，
      无须专门的工厂类来创建产品
    4.可以使用深克隆的方式保存对象的状态，使用原型模式将对象复制一份并将其状态保存起来，
      以便在需要的时候使用（如恢复到某一历史状态），可辅助实现撤销操作.
 
 缺点:
    1.需要为每一个类配备一个克隆方法，而且该克隆方法位于一个类的内部，当对已有的类进行改造时，
      需要修改源代码，违背了“开闭原则”.
    2.在实现深克隆时需要编写较为复杂的代码，而且当对象之间存在多重的嵌套引用时，
      为了实现深克隆，每一层对象对应的类都必须支持深克隆，实现起来可能会比较麻烦
 
 
 适用场景:
 (1) 创建新对象成本较大（如初始化需要占用较长的时间，占用太多的CPU资源或网络资源），
     新的对象可以通过原型模式对已有对象进行复制来获得，如果是相似对象，则可以对其成员变量稍作修改。
 (2) 如果系统要保存对象的状态，而对象的状态变化很小，或者对象本身占用内存较少时，
     可以使用原型模式配合备忘录模式来实现。
 (3) 需要避免使用分层次的工厂类来创建分层次的对象，并且类的实例对象只有一个或很少的几个组合状态，
     通过复制原型对象得到新实例可能比使用构造函数创建一个新实例更加方便。
 */

/*
 需求1:
    Sunny软件公司一直使用自行开发的一套OA (Office Automatic，办公自动化)系统进行日常工作办理，
    但在使用过程中，越来越多的人对工作周报的创建和编写模块产生了抱怨。追其原因，
    Sunny软件公司的OA管理员发现，由于某些岗位每周工作存在重复性，工作周报内容都大同小异，
    这些周报只有一些小地方存在差异，但是现行系统每周默认创建的周报都是空白报表，
    用户只能通过重新输入或不断复制粘贴来填写重复的周报内容，极大降低了工作效率，
    浪费宝贵的时间。如何快速创建相同或者相似的工作周报，成为Sunny公司OA开发人员面临的一个新问题。
 
 需求2:
    通过引入原型模式，Sunny软件公司OA系统支持工作周报的快速克隆，极大提高了工作周报的编写效率，
    受到员工的一致好评。但有员工又发现一个问题，有些工作周报带有附件，
    例如经理助理“小龙女”的周报通常附有本周项目进展报告汇总表、本周客户反馈信息汇总表等，
    如果使用上述原型模式来复制周报，周报虽然可以复制，但是周报的附件并不能复制

 需求3:
    Sunny软件公司在日常办公中有许多公文需要创建、递交和审批，例如《可行性分析报告》、  《立项建议书》、《软件需求规格说明书》、《项目进展报告》等，为了提高工作效率，
    在OA系统中为各类公文均创建了模板，用户可以通过这些模板快速创建新的公文，
    这些公文模板需要统一进行管理，系统根据用户请求的不同生成不同的新公文。
    使用带原型管理器的原型模式实现公文管理器的设计
 */

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        /// copy 实现
        //copyTest()
        /// 需求1
        //weeklyTest()
        /// 需求2
        //weeklyWithAttachmentTest()
        /// 需求3
        propotypeManagerTest()
    }

    // MARK: - 1.克隆实现效果Test
    func copyTest() {
        // 创建实例原型
        let person1 = YAPerson(withName: "机器人")
        
        // 使用实例原型创建对象
        guard let person2 = person1.copy() as? YAPerson else { return }
        guard let person3 = person1.copy() as? YAPerson else { return }
        
        print(person1, person2, person3)
        print("person1的名字\(person1.name)\n" + "person2的名字\(person2.name)\n" + "person3的名字\(person3.name)\n")
        
        person1.personProtocolInstanceMethod()
        person2.personProtocolInstanceMethod()
        person3.personProtocolInstanceMethod()
    }

    // MARK: - 2.周报案例
    func weeklyTest() {
        // 创建实例原型
        print("**** 周报模板 ****")
        let log_previous = YAWeeklyLog(name: "刘", date: "第1周", content: "这周工作内容为...")
        print("周次: \(log_previous.date)\n" + "姓名: \(log_previous.name)\n" + "内容: \(log_previous.content)\n")
        
        // 使用实例原型对象创建对象 (克隆/拷贝)
        print("**** 周报模板克隆 ****")
        guard let log_copy = log_previous.copy() as? YAWeeklyLog else { return }
        print("周次: \(log_copy.date)\n" + "姓名: \(log_copy.name)\n" + "内容: \(log_copy.content)\n")

        // 根据自己需要修改克隆对象的内容
        print("**** 周报模板克隆后修改 ****")
        log_copy.name = "张三";
        log_copy.date = "第2周"
        log_copy.content = "这周工作很忙..."
        print("周次: \(log_copy.date)\n" + "姓名: \(log_copy.name)\n" + "内容: \(log_copy.content)\n")

        print(log_previous,log_copy)
    }
    
    // MARK: - 3.浅拷贝与深拷贝
    func weeklyWithAttachmentTest() {
        // 一个附件类
        let att = Attachment(name: "附件")
        let log_previous = YAWeeklyLogWithAttachment(name: "刘", date: "第1周", content: "这周工作内容为...", attach: att)
        
        guard let log_new = log_previous.copy() as? YAWeeklyLogWithAttachment else { return }
        
        log_new.name = "张三";
        log_new.date = "第2周"
        log_new.content = "这周工作很忙..."
        log_new.attach.name = "新附件"
        
        print("**** 模板 ****")
        print("周次: \(log_previous.date)\n" + "姓名: \(log_previous.name)\n" + "内容: \(log_previous.content)\n" + "附件: \(log_previous.attach.name)\n")
        
        print("**** 克隆模板 ****")
        print("周次: \(log_new.date)\n" + "姓名: \(log_new.name)\n" + "内容: \(log_new.content)\n" + "附件: \(log_new.attach.name)\n")

        /*
          在上面两个日志打印结果可以发现, copy后的 log_new 修改了 (引用类型属性)attach.name = "新附件",
          导致模板的 attach.name 也变成了 "新附件", 而修改其他值类型的属性并不影响模板
          这是浅拷贝
        */
    }
    
    // MARK: - 4.原型管理器的引入和实现
    func propotypeManagerTest() {
        
        //获取原型管理器对象
        let manager = YAProtopeManager.default
        
        // 获取克隆对象
        let far_doc1 = manager.getOfficialDocument(key: "far")
        let far_doc2 = manager.getOfficialDocument(key: "far")

        let srs_doc1 = manager.getOfficialDocument(key: "srs")
        let srs_doc2 = manager.getOfficialDocument(key: "srs")
    
        far_doc1.dispaly()
        far_doc2.dispaly()
        srs_doc1.dispaly()
        srs_doc2.dispaly()

        // 添加新原型
        let new_doc = NewDoc()
        manager.addOffocoalDocument(key: "new", value: new_doc)
        
        let newCopy_doc = manager.getOfficialDocument(key: "new")
        newCopy_doc.dispaly()
    }
}

