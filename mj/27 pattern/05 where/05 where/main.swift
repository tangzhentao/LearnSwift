//
//  main.swift
//  05 where
//
//  Created by void on 2020/5/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 可以使用户where为模式匹配增加匹配条件
 */

var data = (10, "jim")
switch data {
case let (age, _) where age > 10:
    print(data.1, "age 大于 10")
case let (age, _) where age > 0:
    print(data.1, "age 大于 0")

default:
    break
}

/*
 筛选年龄大与6岁的年龄
 */
var ages = [10, 3, 9, 7, 5, 20]
for age in ages where age > 6 {
    print(age)
}

/*
 ##### where用于其他地方的约束
 */
protocol Stackable {
    associatedtype Element
}

// 定义关联类型遵守Stackable协议，且关联类型的关联类型Element遵守Equatable协议
protocol Container: Stackable {
    associatedtype Stack: Stackable where Stack.Element: Equatable
}

// 要求泛型S1和S2都遵守Stackable协议，然后泛型S1和泛型S2的关联类型Element是同一类型，且Element遵守Equatable协议
func equal<S1: Stackable, S2: Stackable>(_ s1: S1, _ s2: S2) -> Bool
    where S1.Element == S2.Element, S1.Element: Equatable {
    return false
}

/*
 ##### 有条件扩展Container协议
 只为满足下列条件的遵守Container协议的类型添加扩展：
 它的关联类型Stack的关联类型Element遵守Equatable协议
 */
extension Container where Self.Stack.Element: Equatable {
    
}
