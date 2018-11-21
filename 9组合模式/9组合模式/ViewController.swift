//
//  ViewController.swift
//  9组合模式
//
//  Created by xygj on 2018/11/16.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

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

class ViewController: UIViewController {
    
    /*
     需求:
        Sunny软件公司欲开发一个杀毒(AntiVirus)软件，该软件既可以对某个文件夹(Folder)杀毒，也可以对某个指定的文件(File)进行杀毒。该杀毒软件还可以根据各类文件的特点，为不同类型的文件提供不同的杀毒方式，例如图像文件(ImageFile)和文本文件(TextFile)的杀毒方式就有所差异。现需要提供该杀毒软件的整体框架设计方案。
     
     使用场景:
        树形结构的构建和处理
     
     */
    
    // Folder: 容器对象
    
    // ImageFile: 叶子对象
    // TextFile: 叶子对象

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newTest()
        
    }
    
    func newTest() {
        var folder1, folder2, folder3: Composite
        
        folder1 = Composite("OneAlon的资料")
        folder2 = Composite("图像文件")
        folder3 = Composite("文本文件")
        
        folder1.add(folder2)
        folder1.add(folder3)
        
        folder2.add(Leaf("小龙女.jpg"))
        folder2.add(Leaf("杨过.gif"))
        
        folder3.add(Leaf("九阳真经.txt"))
        folder3.add(Leaf("独孤九剑.doc"))
        
        folder1.killVirus()
    }
    
    /*
     存在的问题:
        1. Folder文件夹设计太复杂, 系统维护困难
        2. 扩展性差, 如果需要增加新的类型的额叶子和容器都需要修改原来的代码
     */
    func originalTest() {
        var folder1, folder2, folder3: Folder
        
        folder1 = Folder("OneAlon的资料")
        folder2 = Folder("图像文件")
        folder3 = Folder("文本文件")
        
        folder1.addFloder(floder: folder2)
        folder1.addFloder(floder: folder3)
        
        folder2.addImageFile(imageFile: ImageFile("小龙女.jpg"))
        folder2.addImageFile(imageFile: ImageFile("杨过.gif"))
        
        folder3.addTextFile(textFile: TextFile("九阳真经.txt"))
        folder3.addTextFile(textFile: TextFile("独孤九剑.doc"))
        
        folder1.killVirus()
    }

}

