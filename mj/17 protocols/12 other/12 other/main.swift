//
//  main.swift
//  12 other
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 演示各种创建对象的方法
 */

class Person {
    static var count = 0
    static func test () {
        
    }
}

Person.count = 10
Person.test()
Person.self.count = 10
Person.self.test()

var person = Person() // 调用init()
person = Person.init() // 调用init()
person = Person.self() // 调用init()
person = Person.self.init() // 调用init()

var personMetadata = Person.self
//personMetadata = Person // 编译时错误

