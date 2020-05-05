//
//  main.swift
//  04 ClassProperties
//
//  Created by void on 2020/5/1.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("类型属性!")
struct Point {
    var x = 0
    var y = 0
    static var count = 0 { // 类型存储属性，必须给初始值
        willSet {
            print("will set count:", newValue)
        }
        didSet {
            print("did set count: \(oldValue) -> \(count)")
        }
    }
    static func printCount () {
        print("Point count:", count)
    }
    init(x: Int, y: Int) {
        print("Point init")
        self.x = x
        self.y = y
        
        Self.count += 1
    }
}

let p1 = Point(x: 1, y: 2)
Point.printCount()
print("count:", Point.count)
let p2 = Point(x: 2, y: 2)
Point.printCount()
print("count:", Point.count)

func getInitialCount() -> Int {
    print("getInitialCount ()")
    return 10
}

class Size {
    var w = 0
    var h = 0
    static var count = getInitialCount() // 懒加载
    static var displayCount: Int {
        count * 2
    }
    static func printCount () {
        print("Size count:", self.count)
    }
    
    init(w: Int, h: Int) {
        print("Size init")
        self.h = h
        self.w = w
        Self.count += 1
    }
}
let s1 = Size(w: 1, h: 2)
Size.printCount()
print("count:", Size.count)
Size.printCount()
let s2 = Size(w: 2, h: 2)
print("count:", Size.count)
print("display count:", Size.displayCount)


/* 枚举类型 也支持类型属性 */
enum Gender {
    static let allCases = "male, female"
    case male
    case female
}

let gender = Gender.female
print(gender, "all cases:", Gender.allCases)

