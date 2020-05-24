//
//  main.swift
//  02 literal_protocol
//
//  Created by void on 2020/5/23.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 Swift自带类型之所以能够通过字面量初始化，是因为它们遵守了对应的协议
 Bool: ExpressibleByBooleanLiteral
 Int: ExpressibleByIntegerLiteral
 Float、Double: ExpressibleByIntegerLiteral、ExpressibleByFloatLiteral
 Dictionary: ExpressibleByDictionaryLiteral
 String: ExpressibleByStringLiteral
 Array、Set: ExpressibleByArrayLiteral
 Optional: ExpressibleByNilLiteral
 */
let b: Bool = false // 扩展中国实现了对应的协议 extension Bool : ExpressibleByBooleanLiteral
let i: Int = 10 // Int实现了ExpressibleByIntegerLiteral
let f0: Float = 10 // Float实现了ExpressibleByIntegerLiteral
let f1: Float = 10.0 // Float实现了ExpressibleByFloatLiteral
let d0: Double = 10 // Double实现了ExpressibleByIntegerLiteral
let d1: Double = 10.0 // Double实现了ExpressibleByFloatLiteral
let s: String = "jim" // String实现了ExpressibleByStringLiteral
let array: Array = [1 ,2] // Array实现了ExpressibleByArrayLiteral
let set: Set = [1 ,2] // Set实现了ExpressibleByArrayLiteral
let dic: Dictionary = ["name" : "jim"] // Dictionary实现了ExpressibleByDictionaryLiteral
let o: Optional<Int> = nil // Optional实现了ExpressibleByNilLiteral

/*
 字面量协议应用
 - 用Bool值字面量初始化Int类型
 - 用
 */

extension Int: ExpressibleByBooleanLiteral {
    public init(booleanLiteral value: BooleanLiteralType) {
        if value == true {
            self = 1
        } else {
            self = 0
        }
    }
}
var numByBool:Int = true
print("numByBool", numByBool)
numByBool = false
print("numByBool", numByBool)

class Cat: ExpressibleByIntegerLiteral, ExpressibleByStringLiteral {
    var age = 0
    var name = ""
    required init(stringLiteral value: StringLiteralType) {
        name = value
    }
    required init(integerLiteral value: IntegerLiteralType) {
        age = value
    }
    func show() {
        print("cat:", name, age)
    }
}
var cat: Cat = 2
cat.show()
cat = "tom"
cat.show()

struct Point {
    var x = 0.0
    var y = 0.0
}

// 把协议放在扩展中，让编译器继续为我们生产默认初始化器
extension Point: ExpressibleByArrayLiteral, ExpressibleByDictionaryLiteral {
    init(arrayLiteral elements: Double...) {
        guard elements.count > 0 else {
            return
        }
        x = elements[0]
        guard elements.count > 1 else {
            return
        }
        y = elements[1]
    }
    init(dictionaryLiteral elements: (String, Double)...) { // 参数是个元祖为元素的数组，却不是字典，奇怪
        for (key, value) in elements {
            if key == "x" {
                x = value
            } else if key == "y" {
                y = value
            }
        }
    }
}

var p = Point()
p = Point(x: 2, y: 3)
print(p)
p = [4, 5]
print(p)
p = ["x": 10, "y": 20]
print(p)
