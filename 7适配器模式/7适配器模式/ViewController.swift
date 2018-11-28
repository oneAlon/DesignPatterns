//
//  ViewController.swift
//  7适配器模式
//
//  Created by xygj on 2018/11/14.
//  Copyright © 2018 xygj. All rights reserved.
//

import UIKit

/*
 
 不兼容结构的协调-适配器模式
 
 需求:
    Sunny软件公司在很久以前曾开发了一个算法库，里面包含了一些常用的算法，例如排序算法和查找算法，在进行各类软件开发时经常需要重用该算法库中的算法。在为某学校开发教务管理系统时，开发人员发现需要对学生成绩进行排序和查找，该系统的设计人员已经开发了一个成绩操作接口ScoreOperation，在该接口中声明了排序方法sort(int[]) 和查找方法search(int[], int)，为了提高排序和查找的效率，开发人员决定重用算法库中的快速排序算法类QuickSort和二分查找算法类BinarySearch，其中QuickSort的quickSort(int[])方法实现了快速排序，BinarySearch 的binarySearch (int[], int)方法实现了二分查找。
    由于某些原因，现在Sunny公司开发人员已经找不到该算法库的源代码，无法直接通过复制和粘贴操作来重用其中的代码；部分开发人员已经针对ScoreOperation接口编程，如果再要求对该接口进行修改或要求大家直接使用QuickSort类和BinarySearch类将导致大量代码需要修改。
    Sunny软件公司开发人员面对这个没有源码的算法库，遇到一个幸福而又烦恼的问题：如何在既不修改现有接口又不需要任何算法库代码的基础上能够实现算法库的重用？
 
 
 
 
 */


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scores = [10, 15, 30, 60, 99]
        let score = 60
        
        let scoreOperation = AdapterScoreOperation()
        scoreOperation.sort(scores)
        scoreOperation.search(scores, score: score)
    }

}

// 在不修改ScoreOperation的前提下, 修改方法的实际调用
class AdapterScoreOperation: ScoreOperation {
    
    let quickSort = QuickSort()
    let binarySearch = BinarySearch()
    
    override func sort(_ scores: [Int]) {
        quickSort.quickSort(scores)
    }
    
    override func search(_ scores: [Int], score: Int) {
        binarySearch.binarySearch(scores, score: score)
    }
}

// 开发人员设计的
class ScoreOperation {
    
    func sort(_ scores: [Int]) {
        
    }
    
    func search(_ scores: [Int], score: Int) {
        
    }
}

// 要被适配的对象
class QuickSort {
    func quickSort(_ scores: [Int]) {
        
    }
}

// 要被适配的对象
class BinarySearch {
    func binarySearch(_ scores: [Int], score: Int) {
        
    }
}


