//
//  main.swift
//  02 subscript
//
//  Created by void on 2020/5/6.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("下标")

// 基本的下标操作
func testCommonSubscript () {
    struct Point {
        var x = 0.0
        var y = 0.0
        
        subscript(index: Int) -> Double { // 不加关键字 func，不用也不能标明 mutating
            get {
                if index == 0 {
                    return x
                } else {
                    return y
                }
            }
            
            set {
                if index == 0 {
                    x = newValue
                } else {
                    y = newValue
                }
            }
        }
    }

    var p = Point(x: 1, y: 2)
    print("(\(p[0]), \(p[1]))")
    p[0] = 3
    print("(\(p[0]), \(p[1]))")
}
testCommonSubscript ()

// 加参数标签的下标
func testParamLabel() -> Void {
    struct Point {
        var x = 0.0
        var y = 0.0
        
        subscript(index i: Int) -> Double {
            if i == 0 {
                return x
            } else {
                return y
            }
        }
    }

    let p = Point(x: 1, y: 2)
    print("(\(p[index: 0]), \(p[index: 1]))")
}
testParamLabel()

// 类型标签
func testTypeSubscript() -> Void {
    struct Car {
        static var name = "small car"
        static var model = "s-100"
        
        static subscript(index: Int) -> String {
            if index == 0 {
                return name
            } else {
                return model
            }
        }
        
        var age = 0.0
        var maxSpeed = 100.0
        subscript(index: Int) -> Double {
            if index == 0 {
                return age
            } else {
                return maxSpeed
            }
        }
    }
    
    print("name:", Car[0], "model:", Car[1])
    
    let car = Car()
    print("age:", car[0], "maxSpeed:", car[1])

}
testTypeSubscript()

// 特别操作
func testOther () {
    struct Point {
        var x = 0.0
        var y = 0.0
    }
    
    struct PointManager {
        var point = Point()
        subscript(index: Int) -> Point {
            get {
                point
            }
            set {
                point = newValue
            }
        }
        
        func show() -> Void {
            print("point:", point)
        }
    }
    
    var pm = PointManager()
    pm.show()
    pm[0] = Point(x: 1, y: 2)
    pm.show()
    pm[0].x = 10 // 相当于 Point(x: 10, y: pm[0].y)
    pm.show()
}
testOther ()

// 接收多参数的下标
func testMultiParams() -> Void {
    struct Matrix {
        var data = [
            [1, 2, 3],
            [4, 5, 6],
            [7, 8, 9]
        ]
        
        subscript (row: Int, colum: Int) -> Int {
            get {
                guard row >= 0 && row < 3 && colum >= 0 && colum < 3 else {
                    return 0
                }
                return data[row][colum]
            }
            set {
                guard row >= 0 && row < 3 && colum >= 0 && colum < 3 else {
                   return
                }
                data[row][colum] = newValue
            }
        }
        
        func show() -> Void {
            for row in data {
                for item in row {
                    print(item, terminator: " ")
                }
                print("")
            }
        }
    }
    
    var m = Matrix()
    m.show()
    print("三行三列是:", m[2, 2])
    m[1, 2] = 10
    m.show()

}
testMultiParams()
