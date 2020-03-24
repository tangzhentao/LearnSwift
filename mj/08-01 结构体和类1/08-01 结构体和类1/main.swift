//
//  main.swift
//  08-01 结构体和类1
//
//  Created by void on 2020/3/17.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

//func autoCreateInit () {
//    struct Point {
//        var x: Int
//        var y: Int
//    }
//    var point = Point(x: 1, y: 2) // 调用自动创建的初始化器 init(x: Int, y: Int)
//}
//
//func autoCreateMultiInit () {
//    struct Point {
//        var x: Int = 1
//        var y: Int = 2
//    }
//    var point = Point() // 调用自动创建的初始化器 init()
//    point = Point(x: 3, y: 4) // 调用自动创建的初始化器 init(x: Int, y: Int)
//    point = Point(x: 5) // 调用自动创建的初始化器 init(x: Int, y: Int)，y使用默认参数2
//    point = Point(y: 6) // 调用自动创建的初始化器 init(x: Int, y: Int)，x使用默认参数1
//}
//
//func optionalValueInit () {
//    struct Point {
//        var x: Int?
//        var y: Int?
//    }
//    var p1 = Point() // 调用自动创建的初始化器 init()
//    var p2 = Point(x: 3, y: 4) // 调用自动创建的初始化器 init(x: Int, y: Int)
//    var p3 = Point(x: 5) // 调用自动创建的初始化器 init(x: Int, y: Int)，y使用默认参数2
//    var p4 = Point(y: 6) // 调用自动创建的初始化器 init(x: Int, y: Int)，x使用默认参数1
//    print(p1, p2, p3, p4)
//
//}
//
//// 窥探编译器
//func pryIntoInit () {
////    struct Point {
////        var x: Int = 0
////        var y: Int = 0
////    }
//    struct Point {
//        var x: Int
//        var y: Int
//        init() {
//            x = 0
//            y = 0
//        }
//    }
//    var point = Point()
//}
//
//func memoryLayoutOfStruct () {
//    struct Point {
//        var x: Int = 0
//        var y: Int = 0
//        var isOrigin = false
//    }
//
//    print(MemoryLayout<Point>.size) // 17
//    print(MemoryLayout<Point>.stride) // 24
//    print(MemoryLayout<Point>.alignment) // 8
//
//}

func test11 () {
    class MyRect {
        var l: Int
        var w: Int
        init() {
            l = 0
            w = 0
        }
    }
    let r = MyRect()

//    point = Point(x: 1, y: 2) // 编译时报错
}

//autoCreateInit ()
//autoCreateMultiInit ()
////optionalValueInit ()
//pryIntoInit ()
//memoryLayoutOfStruct ()
test11 ()

print("end")
