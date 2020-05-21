//
//  main.swift
//  05 extension_generics
//
//  Created by void on 2020/5/21.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 扩展泛型类型
 - 在扩展中可以使用本体的泛型类型
 */
class Stack<E> {
    var elements = [E]()
    func push(_ element: E) {
        elements.append(element)
    }
}

extension Stack {
    func pop() -> E { // 在扩展中可以使用本体的泛型类型
        elements.removeLast()
    }
}

/*
 ##### 有条件的扩展
 - 如果栈中的元素遵守了`Equatable协议`，则为该栈类添加遵守`Equatable协议`
 */

//
extension Stack: Equatable where E : Equatable {
    static func == (lhs: Stack, rhs: Stack) -> Bool {
        lhs.elements == rhs.elements
    }
}
