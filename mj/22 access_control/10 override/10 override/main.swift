//
//  main.swift
//  10 override
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 成员重写
 - 子类重写成员的访问级别 >= 子类的访问级别，或者 >= 父类被重写成员的访问级别
 - 父类的成员不能被成员作用域外定义的子类重写
 */

class Person {
    fileprivate func breathe() {}
    
    private func run() {}
    
    class Tearcher: Person {
        override func run() {}
    }
}

class Student: Person {
//    private override func breathe() { }// 报错
//    override func run() {} // 报错
}

