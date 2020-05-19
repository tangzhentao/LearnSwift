//
//  main.swift
//  04 init
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation
import Human

/*
 ##### 初始化器
 - 如果一个public类想在另个一模块调用编译器生成的默认无参初始化器，必须显示提供public的无参初始化器
 因为public访问级别的类的默认初始化器时internal级别
 - required初始化器
 required更像是一个约定，而不是定义子类必须重载，因为当用open修饰required初始化器时会报错，说open只能修饰可重载的方法，言外之意，它不能被重载
 required初始化器不能是open访问权限
 要保证任何类能定义子类的地方都能访问到required初始化器，所以它不能被定义为private，具体来说，
    1. 类是open，required初始化器一定是public(因为不能是open)
    2. 类是public，required初始化器可以是public、internal
    3. 类是internal，required初始化器可以是public、internal
    4. 类是fileprivate，required初始化器可以是public、internal、fileprivate
    5. 类是private，required初始化器可以是public、internal、fileprivate
 */

let jim:Person = Person() // 静态库中的类

//class Student: Person {
//    public required init (age: Int) {
//        super.init(age: age)
//    }
//    
//    override func run() {
//        
//    }
//}


