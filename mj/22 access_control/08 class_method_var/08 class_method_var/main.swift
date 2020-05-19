//
//  main.swift
//  08 class_method_var
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 如何通过类方法变量调用类方法
 */

class Person {
    func run(distance: Int) -> Double {
        return Double(distance) / 10.0
    }
}

let classFunc: (Person) -> (Int)->Double = Person.run // runFn的类型是：(Person) -> (Int)->Double
let jim = Person()
let method: (Int)->Double = classFunc(jim)
var time = method(30)
print(time)
time = classFunc(jim)(40)
print(time)
