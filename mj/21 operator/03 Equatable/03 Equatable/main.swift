//
//  main.swift
//  03 Equatable
//
//  Created by void on 2020/5/16.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation


/* Equatable */
struct Point: Equatable {
    var x: Int
    var y: Int
    
    // 也可省略不实现
//    static func == (p1: Point, p2: Point) -> Bool {
//        return p1.x == p2.x && p1.y == p2.y
//    }
}
 
var p1 = Point(x: 1, y: 2)
var p2 = Point(x: 3, y: 4)
let p3 = Point(x: 1, y: 2)
print("p1 == p2:", p1 == p2)
print("p1 == p3:", p1 == p3)

print("p1 != p2:", p1 != p2)
print("p1 != p3:", p1 != p3)


// 默认就遵守并实现了`Equatable`协议
enum Gender: Int {
    case male
    case femal
}

let g1 = Gender.male
let g2 = Gender.femal
let g3 = Gender.male
print("g1 == g2:", g1 == g2)
print("g1 == g3:", g1 == g3)
print("g1 != g2:", g1 != g2)
print("g1 != g3:", g1 != g3)

// 标明遵守`Equatable`协议，就会提供默认实现
enum Score: Equatable {
    case point(Int)
    case grade
}
var s1 = Score.point(99)
var s2 = Score.point(80)
print("s1 == s2", s1 == s2)
print("s1 != s2", s1 != s2)
s2 = Score.point(99)
print("s1 == s2", s1 == s2)
print("s1 != s2", s1 != s2)

class Person {
    
}

let jim = Person()
let tim = Person()
print("jim === tim:", jim === tim)
print("jim !== tim:", jim !== tim)
let jimy = jim
print("jim === jimy:", jim === jimy)
print("jim !== tim:", jim !== tim)
