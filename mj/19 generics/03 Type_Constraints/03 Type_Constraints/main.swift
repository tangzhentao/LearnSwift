//
//  main.swift
//  03 Type_Constraints
//
//  Created by void on 2020/5/15.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 类型约束 */


// 关联类型中的类型约束
protocol Stackable {
    associatedtype E: Equatable
}

// 泛型中的类型约束
class Stack<T: Equatable>: Stackable {
    typealias E = T
}
// 方法中的类型约束
func equal<S: Stackable, T: Stackable>(x: S, y: T) -> Bool
    where S.E == T.E
 {
    return false
}
