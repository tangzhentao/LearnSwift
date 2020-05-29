//
//  main.swift
//  15 escaping_block
//
//  Created by void on 2020/5/29.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 非逃逸闭包 VS 逃逸闭包
 从生命周期看两者区别：

 非逃逸闭包的生命周期与函数相同：

 1，把闭包作为参数传给函数；
 2，函数中调用闭包；
 3，退出函数。结束
 从生命周期看两者区别：

 1，闭包作为参数传递给函数；
 2，退出函数；
 3，闭包被调用，闭包生命周期结束
 
 非逃逸闭包在闭包里调用对象的时候，是不用写self的
 */

var globalClosure: () -> Void = {}

class A {
    func testClosure(closure: @escaping () -> Void) {
//        if let block = closure {
            closure()
//            globalClosure = block
//        }
    }
    deinit {
        print("\(type(of: self)):", #function)
    }
}


class B {
    var name = String("hello world, hello every one")
    
    var a = A()
    
    func test() {
        a.testClosure {
            print(self.name)
        }
    }
    
    deinit {
        print("\(type(of: self)):", #function)
    }
}
do {
    let b = B()
    b.test()
}


