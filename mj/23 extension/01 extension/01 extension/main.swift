//
//  main.swift
//  01 extension
//
//  Created by void on 2020/5/21.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 扩展
 - Swift中的扩展，有点类似于OC中的分类(Category)
 - 扩展可以为枚举、结构体、类、协议添加新功能
 可以添加方法、计算属性、下标、便捷初始化器、嵌套类型、协议等
 ##### 扩展不能做的事情
 - 不能覆盖原有的功能(OC中是可以的)
 - 不能添加存储属性，不能向已有的属性添加属性观察器
 - 不能添加父类
 - 不能添加指定初始化器，不能添加反初始化器
 - 不能添加`required`初始化器
 - ...
 */

/* 计算属性、下标、方法、嵌套类型 */

// 计算属性
extension Double {
    var km: Double { self * 1000 }
    var m: Double { self }
    var dm: Double { self / 10 }
    var cm: Double { self / 100 }
 }

var ten = 10.0
print(ten.km)
print(ten.m)
print(ten.dm)
print(ten.cm)

// 下标

// 先看下startIndex、endIndex是什么
// startIndex 集合中第一个元素的索引
// endIndex 集合中最后一个元素的后一个位置的索引
// 集合为空时 startIndex == 0、 endIndex == 0
var array = [1, 2, 3, 4]
print("startIndex:", array.startIndex) // 0
print("endIndex:", array.endIndex) // 4
array = []
print("startIndex:", array.startIndex) // 0
print("endIndex:", array.endIndex) // 0
array = [1, 2, 3, 4]
extension Array {
    subscript(safeIdx idx: Int) -> Element? {
        if (startIndex ..< endIndex).contains(idx) {
            return self[idx]
        } else {
            return nil
        }
    }
}

print(array[safeIdx: -1] as Any)
print(array[safeIdx: 1] as Any)
print(array[safeIdx: 10] as Any)

// 嵌套类型
extension Int {
    enum Kind { case negative, zero, positive }
    
    var kind: Kind {
        if self > 0 {
            return .positive
        } else if self == 0 {
            return .zero
        } else {
            return .negative
        }
    }
}

print(10.kind)
print(0.kind)
print((-10).kind)
