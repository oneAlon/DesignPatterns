//
//  ViewController.swift
//  11外观模式
//
//  Created by xygj on 2018/11/20.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     需求:
        某软件公司欲开发一个可应用于多个软件的文件加密模块，该模块可以对文件中的数据进行加密并将加密之后的数据存储在一个新文件中,
        具体的流程包括三个部分，分别是读取源文件、加密、保存加密之后的文件，其中，读取文件和保存文件使用流来实现，加密操作通过求模运算实现。这三个操作相对独立，
        为了实现代码的独立重用，让设计更符合单一职责原则，这三个操作的业务代码封装在三个不同的类中。
     
     现使用外观模式设计该文件加密模块。
     
     使用场景:
        外观模式时一个使用非常频繁的设计模式
        一个客户类要和多个业务类交互, 而这些交互的业务类经常作为一个整体出现, 这个时候可以使用外观模式, 为客户端提供一个简化的入口, 简化客户类和业务类的交互.
     
     
     优点:
        1. 屏蔽了子系统组件, 使子系统用起来更加方便, 客户端的代码相对简单
        2. 与客户端关联的对象较少, 松耦合, 子系统发生变化时不会影响到客户端
     缺点:
        1. 如果设计不当, 增加新的子系统就需要增加新的外观类, 违背了开闭原则
     
     */

    override func viewDidLoad() {
        super.viewDidLoad()
        EncryptFacade().fileEncrypt(fileNameSrc: "file1", fileNameDes: "file2")
    }
}

// MARK: - 标准外观模式

// 添加中间类
class EncryptFacade{
    lazy var fileReader: FileReader = {
        return FileReader()
    }()
    lazy var fileWriter: FileWriter = {
        return FileWriter()
    }()
    lazy var cipherMachine: CipherMachine = {
        return CipherMachine()
    }()
    
    
    // 读取文件->加密内容->写入文件
    func fileEncrypt(fileNameSrc: String, fileNameDes: String) {
        let fileContent = fileReader.read(fileNameSrc: fileNameSrc)
        let fileEncryptContent = cipherMachine.encrypt(text: fileContent)
        fileWriter.write(fileNameDes: fileEncryptContent)
    }
}

// 文件读取类
class FileReader {
    func read(fileNameSrc: String) -> String {
        print("读取\(fileNameSrc)的内容")
        return "\(fileNameSrc)的内容"
    }
}

// 内容加密类
class CipherMachine {
    func encrypt(text: String) -> String {
        print("加密\(text)")
        return "加密\(text)以后的内容"
    }
}

// 文件写入类
class FileWriter {
    func write(fileNameDes: String) {
        print("写入内容到\(fileNameDes)中")
    }
}

