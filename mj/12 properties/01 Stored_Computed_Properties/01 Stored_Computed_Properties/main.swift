//
//  main.swift
//  Stored_Computed_Properties
//
//  Created by void on 2020/4/29.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("存储属性和计算属性!")

struct Circle {
    var radius = 0.0
    var diameter: Double {
        set {
            radius = newValue / 2
        }
        
        get {
            return radius * 2
        }
    }
}

class Size {
    // 存储属性
    var width = 0.0
    var height = 0.0
    
    // 计算属性
    var area: Double {
        return width * height
    }
}

enum Gender {
    case male
    case female
    
    // 计算属性
    var next: Gender {
        if self == .male {
            return .female
        } else {
            return .male
        }
    }
}

let gender = Gender.male
print("gender:", gender)
print("next gender:", gender.next)

/*
 枚举原始值rawValue的本质：只读计算属性
 */

enum Answer: Int {
    case A
    case B
    case C
    case D

    var rawValue: Int {

        switch self {
        case .A:
            return 1
        case .B:
            return 2
        case .C:
            return 3
        case .D:
            return 4
        }
    }
}

var answer = Answer.A
print(answer, answer.rawValue) // A 1 而不是 A 0


/*
 延迟存储属性
 */
print("\n延迟存储属性\n")
class Car {
    init() {
        print("Car init")
    }
    
    func run() -> Void {
        print("car is running")
    }
}

class Person {
    lazy var car = Car()
    init() {
        print("Person init")
    }
    
    func travel() -> Void {
        car.run()
    }
}

let jim = Person()
print("--------")
jim.travel()

// 延迟存储属性注意点
struct Point {
    var x = 0
    var y = 0
    lazy var z = 0
}
let p = Point()
//print(p.z) // 编译时错误
