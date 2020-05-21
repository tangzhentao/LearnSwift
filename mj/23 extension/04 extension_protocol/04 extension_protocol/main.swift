//
//  main.swift
//  04 extension_protocol
//
//  Created by void on 2020/5/21.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

// 跳过03 哈哈哈 笔误了

/*
 ##### 扩展协议
 如果一个类型，已经实现了协议的所有要求，但是还没有声明它遵守了这个协议，可以通过扩展让它遵守这个协议
 */

protocol TestProtocol {
    func test()
}

class Test {
    func test() {
        print("test")
    }
}

extension Test: TestProtocol {}

/* 为协议扩展方法的实现
 - 为协议中已声明的方法扩展实现\
 - 为协议中未声明的方法扩展实现
 - 类型在实现协议时，如果协议方法在协议的扩展中已经实现，类型可以实现也可以不实现这个方法
 - 如果协议方法是声明在协议本体中的，在协议扩展中和类型中都有实现，那么调用时，使用类型中的实现
 - 如果协议方法不是声明在协议本体中的，且在协议扩展中和类型中都有实现，那么调用时
    1. 如果变量/常量是用类型来定义的，则调用类型中的实现
    2. 如果变量/常量是用协议来定义的，则调用扩展协议中的实现
 */

protocol A {
    func a()
}

extension A {
    func a() {
        print("a in extension")
    }
    func b() {
        print("b in extension")
    }
}

/*
 协议的扩展中已经添加了实现，所以中可不实现，也可实现
 */
class Cat: A {
    func a() {
        print("a in Cat")
    }
    func b() {
        print("b in Cat")
    }
}

let tom = Cat()
tom.a()
tom.b() // 调用类型中的实现

let aObjc: A = Cat()
aObjc.a()
aObjc.b() // 调用协议扩展中的实现



