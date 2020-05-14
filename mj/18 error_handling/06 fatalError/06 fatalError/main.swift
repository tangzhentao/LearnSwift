//
//  main.swift
//  06 fatalError
//
//  Created by void on 2020/5/14.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

func test(num: Int) -> Int {
    if num >= 1 {
        return 1
    }
    
    fatalError("num不能小于0")
}

//test(num: -1)

class Person {
    required init() {
        print("Person init")
    }

}

class Student: Person {
    var score = 0
    required init() {
        print("Student init")
        super.init() // 可以省略，因为父类中只有一个指定初始化器且是无参的
        fatalError("不要调用Student的init()初始化器，使用其他初始化器")
    }
    
    init(score: Int) {
        print("Student init(score: Int)")
        super.init() // 可以省略，因为父类中只有一个指定初始化器且是无参的
    }
}

var jim = Student(score: 40)
jim = Student() // 抛出错误，crash

