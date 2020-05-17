//
//  main.swift
//  04 Comparable
//
//  Created by void on 2020/5/16.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

struct Time: Comparable {
    var hour: Int
    var min: Int
    
    // lhs: Left-Hand Side
    static func < (lhs: Time, rhs: Time) -> Bool {
        return (lhs.hour < rhs.hour) || (lhs.hour == rhs.hour && lhs.min < rhs.min)
    }
    static func > (lhs: Time, rhs: Time) -> Bool {
        return (lhs.hour > rhs.hour) || (lhs.hour == rhs.hour && lhs.min > rhs.min)
    }
    static func <= (lhs: Time, rhs: Time) -> Bool {
        return !(lhs > rhs)
    }
    static func >= (lhs: Time, rhs: Time) -> Bool {
        return !(lhs < rhs)
    }
}

var t1 = Time(hour: 10, min: 20)
var t2 = Time(hour: 8, min: 20)
print("t1 < t2:", t1 < t2)
print("t1 > t2:", t1 > t2)
print("t1 <= t2:", t1 <= t2)
print("t1 >= t2:", t1 >= t2)

print("--------")
t2 = Time(hour: 10, min: 20)
print("t1 < t2:", t1 < t2)
print("t1 > t2:", t1 > t2)
print("t1 <= t2:", t1 <= t2)
print("t1 >= t2:", t1 >= t2)
