//
//  main.swift
//  08-03汇编窥探引用类型
//
//  Created by void on 2020/3/24.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

func referenceTypeAssignment() {
    class Point {
        var x = 0
        var y = 0
        
        init(x: Int, y: Int) {
            self.x = x
            self.y = y
        }
    }
    
    let p1 = Point(x: 1, y: 2) // allocing申请的内存地址存放在寄存器rax中
    let p2 = p1
    p2.x = 3
    p2.y = 4
    
//    print("p1: (\(p1.x), \(p1.y))")
//    print("p2: (\(p2.x), \(p2.y))")
//
//    let a1 = withUnsafePointer(to: &p1) {
//        UnsafeRawPointer($0)
//    }
//    print("a1", a1)
//
//    let a3 = withUnsafePointer(to: &p2) {
//        UnsafeRawPointer($0)
//    }
//    var heapPtr = UnsafeRawPointer(bitPattern: a1.load(as: UInt.self))
//    print("heapPtr", heapPtr!)
//
//    heapPtr = UnsafeRawPointer(bitPattern: a3.load(as: UInt.self))
//    print("heapPtr", heapPtr!)
}

func testLet () {
    struct Point {
        var x = 0
        var y = 0
    }
    
    class Size {
        var w = 0
        var h = 0
    }
    
    let p = Point()
    let s = Size()
    s.w = 2
//    s = Size() // ❌
    
//    p.x = 2 // ❌
//    p = Point(x: 1, y: 2) // ❌
    
    // 字符串
    let str = "hello"
//    str.append("world") // ❌
//    str = "world" // ❌
    
    // 数组
    let array = [1, 2, 3]
//    array.append(4) // ❌
//    array = [2, 3] array
    
    // 字典
    let dict = ["name": "jim"]
//    dict["name"] = "tom" // ❌
//    dict["newKey"] = "value" // ❌
    
}

referenceTypeAssignment()

testLet ()
