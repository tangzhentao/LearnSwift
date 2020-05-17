//
//  main.swift
//  02 operator_overload
//
//  Created by void on 2020/5/16.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 运算符重载 */
struct Point {
    var x: Int
    var y: Int
    
    init(x: Int, y: Int) {
        print("Point init: (\(x), \(y))")
        self.x = x
        self.y = y
    }
    
    static func + (p1: Point, p2: Point) -> Point { // 必须用static, 不管是结构体还是类中
        Point(x: p1.x + p2.x, y: p1.y + p2.y)
    }
    
    static func += (p1: inout Point, p2: Point) { // 必须用static, 不管是结构体还是类中
//        p1 = p1 + p2
        p1.x += p2.x
        p1.y += p2.y
    }
    
    // 负号运算符
    static prefix func - (p: Point) -> Point {
        Point(x: -p.x, y: -p.y)
    }
    
    // 后++运算符
    static postfix func ++ (p: inout Point) -> Point {
        let tmpPoint = p
        p.x += 1
        p.y += 1
        return tmpPoint
    }
    
    static func == (p1: Point, p2: Point) -> Bool {
        return p1.x == p2.x && p1.y == p2.y
    }
}

/* 把运算符重载定义为一个全局函数也可以 */
//func + (p1: Point, p2: Point) -> Point {
//    Point(x: p1.x + p2.x, y: p1.y + p2.y)
//}

var p1 = Point(x: 1, y: 2)
var p2 = Point(x: 3, y: 4)
let p3 = p1 + p2

let p4 = p1 + p2 + p3 // 先计算前两个，再用和与第三个相加

p1 += p2
print("p1:", p1)
print("p1:", -p1)
print("p2++:", p2++)
print("p2:", p2)

