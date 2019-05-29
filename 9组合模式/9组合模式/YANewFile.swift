//
//  YANewFile.swift
//  9组合模式
//
//  Created by xygj on 2018/11/19.
//  Copyright © 2018 xygj. All rights reserved.
//

import Foundation

/*
  1.透明组合模式:
      抽象构件Component中声明了所有用于管理成员对象的方法，包括add()、remove()以及
      getChild()等方法，这样做的好处是确保所有的构件类都有相同的接口。在客户端看来，
      叶子对象与容器对象所提供的方法是一致的，客户端可以相同地对待所有的对象。
 
      缺点:
         不够安全，因为叶子对象和容器对象在本质上是有区别的。叶子对象不可能有下一个层次的对象，
         即不可能包含成员对象，因此为其提供add()、remove()以及getChild()等方法是没有意义的，
         这在编译阶段不会出错，但在运行阶段如果调用这些方法可能会出错（如果没有提供相应的错误处理代码）

 
   2.安全组合模式:
       在抽象构件Component中没有声明任何用于管理成员对象的方法，
       而是在Composite类中声明并实现这些方法(add()、remove()等)。这种做法是安全的，
       因为根本不向叶子对象提供这些管理成员对象的方法，
       对于叶子对象，客户端不可能调用到这些方法
 
       缺点:
          不够透明，因为叶子构件和容器构件具有不同的方法，
          且容器构件中那些用于管理成员对象的方法没有在抽象构件类中定义，
          因此客户端不能完全针对抽象编程，必须有区别地对待叶子构件和容器构件。
 */



// MARK: - 在这里使用的是 === 透明组合模式 ===
protocol Component {
    
    var name: String{ get set }
    
    
    func add(_ component: Component)
    func getChild(i: Int) -> Component?
    func killVirus()
    
}

extension Component {
    func add(_ component: Component) {
        print("不支持此方法")
    }
    func getChild(i: Int) -> Component? {
        print("不支持此方法")
        return nil
    }
    func killVirus() {
        
    }
}

// 叶子
class Leaf: Component {
    
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func killVirus() {
        print("对\(name)杀毒了哦")
    }
}

// 容器
class Composite: Component {
    
    var componentList: [Component] = [Component]()
    var name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func add(_ component: Component) {
        componentList.append(component)
    }
    func getChild(i: Int) -> Component? {
        return componentList[i]
    }
    func killVirus() {
        print("对\(name)文件夹杀毒")
        for component in componentList {
            component.killVirus()
        }
    }
}
