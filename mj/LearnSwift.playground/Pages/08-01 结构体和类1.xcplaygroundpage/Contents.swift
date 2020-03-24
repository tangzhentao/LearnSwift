//: [Previous](@previous)

import Foundation



func autoCreateInit () {
    struct Point {
        var x: Int
        var y: Int
    }
    var point = Point(x: 1, y: 2) // 调用自动创建的初始化器 init(x: Int, y: Int)
    print(point)
}

autoCreateInit ()
//: [Next](@next)
