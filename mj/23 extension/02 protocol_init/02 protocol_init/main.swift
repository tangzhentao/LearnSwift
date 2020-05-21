//
//  main.swift
//  02 protocol_init
//
//  Created by void on 2020/5/21.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

class Person {
    var age = 0
    var name = ""
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
}

// 扩展类遵守协议
extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.age == rhs.age && lhs.name == rhs.name
    }
    
    
}

// 为类扩展便携初始化器
extension Person {
    convenience init(name: String) {
        self.init(age: 0, name: name)
    }
}



struct Point {
    var x = 0
    var y = 0
}

/*
 ##### 为结构体扩展初始化器，不影响编译器为结构体提供默认初始化器
 */
extension Point {
    init(p: Point) {
        self.init(x: p.x, y: p.y)
    }
}

var p = Point()
p = Point(x: 1)
p = Point(y: 2)
p = Point(x: 1, y: 2)
p = Point(p: Point(x: 4, y: 5))

/*
 - 为类扩展初始化器时，不能添加required初始化器，因为那是指定初始化器
 - 为类扩展协议时，如果协议中有初始化器，也不能扩展这个初始化器
 因为协议中的init是required的
 */

protocol Living {
    init ()
}

//extension Person: Living {
//    required init() {
//
//    }
//}

