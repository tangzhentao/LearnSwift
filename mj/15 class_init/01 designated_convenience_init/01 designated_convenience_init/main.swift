//
//  main.swift
//  01 designated_convenience_init
//
//  Created by void on 2020/5/10.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 1、默认初始化器：如果程序员没有为类定义指定初始化器(便捷初始化器不算)，编译器会自动生成一个默认初始化器
 */

/*
 默认初始化器时编译器为某个类生成的无参初始化器。
 生成默认初始化器的条件：
 - 程序员没有为类定义`指定初始化器`(定义便捷初始化器不算)
 - 类的实例存储属性都提供了默认值
 */
func testDefautInit() {
    class Person {
        var age: Double = 0

        convenience init(age: Double) {
            self.init()
            self.age = age
        }
    }
    
    let _ = Person()
}


func testDesignatedConvenienceInit() {
    class Person {
        var age: Double = 0
        var name:String
        
        init(age: Double, name: String) {
            self.name = name
            self.age = age
        }
        
        convenience init(age: Double) {
            self.init(age: age, name:"")
        }
        
        convenience init(name: String) {
            self.init(age: 0, name:name)
        }
        
        convenience init() {
            self.init(age: 0)
        }
    }
    
    class Student: Person {
        var sid = 0
        
        init(age: Double, name: String, sid: Int) {
            super.init(age: age, name: name)
            self.sid = sid
        }
        
        convenience init() {
            self.init(age:0, name: "", sid: 0)
        }
    }
    
    let _ = Student()
}
testDesignatedConvenienceInit()

/* 两段初始化
    1、初始化
    2、修改
 */
func testTwoPhaseInit() {
    class Person {
        var age: Double = 0
        var name:String
        
        init(age: Double, name: String) {
            
//            greet() // 报错，第一阶段还没完成(初始化实例存储属性)
//            let block = { self.greet() } // 在第一阶段完成前，捕获self也会报错
            
            self.name = name
            self.age = age
            
            self.greet() // 第一阶段完成，可以访问self
        }
        
        convenience init(age: Double) {
            self.init(age: age, name:"")
        }
        
        convenience init(name: String) {
            self.init(age: 0, name:name)
        }
        
        private init() {
            age = 0
            name = ""
        }
        
        func greet() {
            print("hello")
        }
    }
    
    class Student: Person {
        var sid: Int
        
        init(age: Double, name: String, sid: Int) {
            self.sid = sid
//            self.show() // 第一阶段还未完成，访问self报错
            super.init(age: age, name: name)
            self.show() // 第一阶段还完成，可以访问self
            self.age = 1

        }
        
        override convenience init(age: Double, name: String) {
            self.init(age: age, name: name, sid: 0)
        }
        
        init() {
            self.sid = 0
            super.init(age: 0, name: "")

//            self.init(age:0, name: "", sid: 0)
        }
        
        func show() {
            print("la lala")
        }
    }
    
    let _ = Student()
}

