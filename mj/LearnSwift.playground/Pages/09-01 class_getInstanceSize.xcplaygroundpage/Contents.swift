
//: [Previous](@previous)

import Foundation

func testInstanceSize () -> Void {
    class Point {
        // 16字节：类信息和引用计数
        var x = 0 // 8字节
        var text = false // 1字节
        var y = 0 // 8字节
    }// 考虑内存对齐的话就是占用40个字节
    
    let size = class_getInstanceSize(Point.self) // 考虑对象内成员的内存对齐
    print("Point size:", size) // 40
    
    print("stride", MemoryLayout<Point>.stride) // 8：数组中存储该类型变量占用的内存
    print("size", MemoryLayout<Point>.size) // 和class_getInstanceSize一样
    print("alignment", MemoryLayout<Point>.alignment) // 8: 内存对齐是8
    
    let p = Point() // malloc会为它分配48个字节，因为malloc分配的内存是16的倍数
}
testInstanceSize ()

func testMethod () -> Void {
    
    // 类
    class Size {
        var width = 0
        var height = 0
        func show () -> Void {
            print("Size(\(width), \(height))")
        }
    }
    
    Size().show()
    
    // 结构体
    struct Point {
        var x = 0
        var y = 0
        
        func show() -> Void {
            print("Point(\(x), \(y)")
        }
    }
    
    Point(x: 10, y: 20).show()
    
    // 枚举
    enum Gender: Int {
        case male
        case female
        
        func show() -> Void {
            print("Gender: \(self)<\(rawValue)>")
        }
    }
    
    Gender.female.show()
}
testMethod ()


//: [Next](@next)
