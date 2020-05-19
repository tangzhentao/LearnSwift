//
//  main.swift
//  02 private
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 虽然类Person的访问级别是private，但仍然可以定义访问级别为fileprivate的Student
 因为全局作用域中的private等价于fileprivate
 */
private class Person {}
fileprivate class Student: Person {}

/*
 这里的private Animal就不能定义访问级别更高的Cat了，
 因为这里的private确实是private
 */
class Test {
    fileprivate class Animal {}
//    fileprivate class Cat: Animal {} // 报编译时错误
    fileprivate class Cat: Animal {}
}

fileprivate let cat = Test.Cat()


private struct Dog { // Dog类型访问级别实际上是fileprivate
    var age = 0 // fileprivate
    func run() { } // fileprivate
}
fileprivate struct House {
    var dog: Dog = Dog()
    mutating func walk () {
        dog.run()
        dog.age = 1
    }
}

private struct Dog1 { // Dog类型访问级别实际上是fileprivate
    private var age = 0 // private
    func run() { } // fileprivate
}
fileprivate struct House1 {
    var dog: Dog1 = Dog1()
    mutating func walk () {
        dog.run()
//        dog.age = 1 // 报编译时错误，访问了dog私有变量
    }
}

