//
//  main.swift
//  01 instance_type_method
//
//  Created by void on 2020/5/5.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("Hello, World!")

class Car {
    static var count = 0
    static func getCount () -> Int {
        count // 等价于下面两种形式
//        self.count
//        Car.count
        
    }
    
    init() {
        Car.count += 1
    }
}

let c1 = Car()
let c2 = Car()
let c3 = Car()

print("car count:", Car.getCount())

/* mutating */

struct Point {
    var x = 0.0, y = 0.0
    @discardableResult mutating func moveBy(deltaX: Double, deltaY: Double) -> Point {
        x += deltaX
        y += deltaY
        
        return self
    }
}

enum State {
    case low, middle, high
    
    mutating func next() -> Void {
        switch self {
        case .low:
            self = .middle
            
        case .middle:
            self = .high
            
        case .high:
            self = .low
        }
    }
}

var p1 = Point()
p1.moveBy(deltaX: 2, deltaY: 2)
