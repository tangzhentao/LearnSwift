//
//  AdvancedOperators.swift
//  HelloWorld
//
//  Created by itang on 2019/9/30.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class AdvancedOperators {
    func learn() {
        
        // bitwise not operator 按位取反运算符
        let initialBits: UInt8 = 0b00001111
        let invertedBits = ~initialBits
        print(initialBits)
        print(invertedBits)
        // bitwise and operator 按位与运算符
        let firstSixBits: UInt8 = 0b11111100
        let lastSixBits: UInt8 = 0b00111111
        let middleFourBits = firstSixBits & lastSixBits
        print(middleFourBits)
        
        // bitwise or operator 按位或操作符
        let fullEightBits = firstSixBits | lastSixBits
        print(fullEightBits)
        
        // bitwise xor operator 按位异或操作符
        let firstBits: UInt8 = 0b00001000
        let otherBits: UInt8 = 0b00011000
        let outputBits = firstBits ^ otherBits
        print(outputBits)
        
        /* bitwise left and right shift operator 按位左移和右移操作符 */
        
        // 无符号数
        let shiftBits: UInt8 = 0b00000100
        print(shiftBits)
        let leftShit1 = shiftBits << 1
        print(leftShit1)
        let leftShit2 = shiftBits << 2
        print(leftShit2)
        let leftShit5 = shiftBits << 5
        print(leftShit5)
        let leftShit6 = shiftBits << 6
        print(leftShit6)
        let rightShit2 = shiftBits >> 2
        print(rightShit2)
        
        // 对其他数据类型进行编码和解码
        let pink: UInt32 = 0xcc6699
        let redComponent = (pink & 0xFF0000) >> 16
        let greenComponent = (pink & 0xFF00) >> 8
        let blueComponent = (pink & 0xFF)
        
        print("red:", redComponent, "green:", greenComponent, "blue:", blueComponent)
        
        
        // 有符号数：右移左侧补全符号位
        let positiveBits: Int8 = 0b0101111
        print(positiveBits)
        let pBitsRightShift1 = positiveBits >> 1
        print(pBitsRightShift1)
        
        let negetiveBits: Int8 = -0b011
        print(negetiveBits)
        let nBitsRightShift1 = negetiveBits >> 1
        print(nBitsRightShift1)

        let pBitsLeftShift1 = positiveBits << 2
        print(pBitsLeftShift1)
        let nBitsLeftShift1 = negetiveBits << 1
        print(nBitsLeftShift1)
        
        // 溢出运算
//        var protentialOverflow = UInt16.max
//        protentialOverflow += 1 // 报编译错误
        
        var maxInt8: Int8 = 0b1111100
        print("max int8:", maxInt8)
        
//        for _ in 1...6 {
//            maxInt8 += 1 // 运行时报错，在循环几圈之后
//            print("max int8:", maxInt8)
//        }
        
        // 数值溢出
        
        // 上溢
        var uint8Max = UInt8.max
        print("max uint8:", uint8Max)
        uint8Max = uint8Max &+ 1
        print("max uint8:", uint8Max)
        // 下溢
        var uint8Min = UInt8.min
        print("min uint8:", uint8Min)
        uint8Min = uint8Max &- 1
        print("min uint8:", uint8Min)

        var int8Max = Int8.max
        print("max int8:", int8Max)
        int8Max = int8Max &+ 1
        print("max int8:", int8Max)
        
        var int8Min = Int8.min
        print("min int8:", int8Min)
        int8Min = int8Min &- 1
        print("min int8:", int8Min)
        
        // 运算符函数
        
        // 中缀运算符
        let vector1 = Vector2D(x: 1, y: 3)
        let vector2 = Vector2D(x: 2, y: 4)
        let vector3 = vector1 + vector2
        print("vector3:", vector3)
        
        // 前缀运算符
        let positiveVector = Vector2D(x: 2, y: 3)
        let negetiveVector = -positiveVector
        print("negetive vector:", negetiveVector)
        
        var vector4 = positiveVector
        vector4 += negetiveVector
        print("vector4:", vector4)
        
        // 等价运算符
        let oneTwo = Vector2D(x: 1, y: 2)
        let anotherOneTwo = Vector2D(x: 1, y: 2)
        
        // 实现了==操作符，!= 操作符编译器自动实现
        if oneTwo != anotherOneTwo {
            print("oneTwo != anotherOneTwo")
        } else {
            print("oneTwo == anotherOneTwo")
        }
        
        // 使用默认实现的 ==
        let oneTwoThree = Vector3D(x: 1, y: 2, z: 3)
        let anthoerOneTwoThree = Vector3D(x: 1, y: 2, z: 3)
        
        if oneTwoThree == anthoerOneTwoThree {
            print("oneTwoThree == anthoerOneTwoThree")
        } else {
            print("oneTwoThree != anthoerOneTwoThree")
        }
        
        // 自定义操作符
        var tobeDoubledVector = Vector2D(x: 2, y: 3)
        +++tobeDoubledVector
        print("tobeDoubledVector:", tobeDoubledVector)
        
        let threeFour = Vector2D(x: 3, y: 4)
        let oneThree = Vector2D(x: 1, y: 3)
        let resut = threeFour +- oneThree
        print("resut:", resut)

    }
}

// 运算符函数
struct Vector2D {
    var x = 0.0
    var y = 0.0
}

// 这样也可以实现运算符的加法
//func + (left: Vector2D, right: Vector2D) -> Vector2D {
//    return Vector2D(x: left.x + right.x, y: left.y + right.y)
//}

prefix operator +++
extension Vector2D: Equatable {
    static func + (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x + right.x, y: left.y + right.y)
    }
    
    static prefix func - (right: Vector2D) -> Vector2D {
        return Vector2D(x: -right.x, y: -right.y)
    }
    
    static func += (left: inout Vector2D, right: Vector2D) {
        left = left + right
    }
    
    static func == (left: Vector2D, right: Vector2D) -> Bool {
        return (left.x == right.x) && (left.y == right.y)
    }
    
    static prefix func +++ (vector: inout Vector2D) {
        vector += vector
    }
}

// 自定义中缀运算符优先级
infix operator +-: AdditionPrecedence
extension Vector2D {
    static func +- (left: Vector2D, right: Vector2D) -> Vector2D {
        return Vector2D(x: left.x  + right.x, y: left.y - right.y)
    }
}

struct Vector3D: Equatable {
    var x = 0.0, y = 0.0, z = 0.0
    
    func desciption() {
        print(self)
    }
}
