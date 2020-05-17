//
//  main.swift
//  05 custom_operator
//
//  Created by void on 2020/5/17.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

// 自定义运算符 +++

// 1. 先声明
// 2. 再实现

/*
 prefix 前缀
 postfix 后缀
 infix 中缀
 */

// 1. 声明
prefix operator +++

// 2. 再实现
prefix func +++ (x: inout Int) -> Int {
    x += 2
    return x
}

var i = 1
let j = +++i
print("j:", j)
print("i:", i)

/* 更详细的自定义运算符 */
infix operator +-: PlusMiusPrecedence
precedencegroup PlusMiusPrecedence { //  precedencegroup: 优先级组
    associativity: left // 结合性：出现两个个或以上该操作符时，是左结合、右结合，还是不结合(不允许两个或以上同时出现)
    higherThan: AdditionPrecedence // 比谁的优先级高
    lowerThan: MultiplicationPrecedence // 比谁的优先级低
    assignment: true // 为真代表在可选链操作中和赋值运算符有着相同的优先级: 前面的可选链值为nil，不执行该运算符操作
                     // 为假时，不能用于可选链
}

struct Point: CustomStringConvertible {
    var x: Int
    var y: Int
    
    static func + (lhs: Point, rhs: Point) -> Point { // 必须用static, 不管是结构体还是类中
        print("+")
        return Point(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    static func * (lhs: Point, rhs: Point) -> Point { // 必须用static, 不管是结构体还是类中
        print("*")
        return Point(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
    
    static func +- (lhs: Point, rhs: Point) -> Point {
        print("+-")
        return Point(x: lhs.x + rhs.x, y: lhs.y - rhs.y)
    }
    
    var description: String {
        return "(\(x), \(y))"
    }
    
    func show() {
        print(self)
    }
}

var p1 = Point(x: 1, y: 2)
var p2 = Point(x: 3, y: 4)
let p3 = Point(x: 3, y: 3)
//print("p1\(p1) + p2\(p2) =", p1 + p2)
//print("p1\(p1) * p2\(p2) =", p1 * p2)
//
//print("p1\(p1) + p2\(p2) + p3\(p3) =", p1 + p2 + p3)
//print("p1\(p1) + p2\(p2) * p3\(p3) =", p1 + p2 * p3)
//print("p1\(p1) +- p2\(p2) =", p1 +- p2)
//print("p1\(p1) +- p2\(p2) +- p3\(p3) =", p1 +- p2 +- p3)
//print("p1\(p1) + p2\(p2) +- p3\(p3) =", p1 + p2 +- p3)
//print("p1\(p1) + p2\(p2) +- p3\(p3) * p1\(p1) =", p1 + p2 +- p3 * p1)


struct Rect {
    var p: Point
}

func getPoint() -> Point {
    print("get point")
    return Point(x: 2, y: 2)
}

var r: Rect? = Rect(p: p1)
//r?.p = getPoint()
//r?.p +- p1
r = nil
//r?.p = getPoint()

r?.p +- p1

