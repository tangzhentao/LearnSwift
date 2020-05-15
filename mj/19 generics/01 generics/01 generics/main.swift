//
//  main.swift
//  01 generics
//
//  Created by void on 2020/5/15.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

// 泛型函数
func genericFuntion() {
    func swapNum<T>(x: inout T, y: inout T) {
        (x, y) = (y, x)
    }

    var a: Any = 1, b: Any = 2
    swapNum(x: &a, y: &b)
    print("a: \(a), b: \(b)")

    a = 10.0
    b = 20.0
    swapNum(x: &a, y: &b)
    print("a: \(a), b: \(b)")

    let swapFn: (inout Int, inout Int)->Void = swapNum
    var x = 6
    var y = 8
    swapFn(&x, &y)
    print("a: \(x), b: \(y)")
}

// 泛型类
func genericClass() {
    class Stack<E> {
        var array = [E]()
        
        init() {
            
        }
        
        init(array: [E]) {
            self.array = array
        }
        
        func push(_ element: E) {
            array.append(element)
        }
        
        @discardableResult func pop() -> E {
            return array.removeLast()
        }
        
        var size: Int {
            return array.count
        }
        
        func show() {
            print("stack:", terminator:" ")
            for item in array {
                print(item, terminator:" ")
            }
            print("")
        }
    }
    
    var intStack = Stack<Int>() // 需要标明Int，否则Stack无法知道泛型T的类型
    let array = [1,2,3,4]
    intStack = Stack(array: array) // 需要标明Int，Stack可以通过array的元素类型知道泛型T的类型为Int
    intStack.show()
    let count = intStack.size
    for _ in 1...count {
        intStack.pop()
        intStack.show()
    }
}
genericClass()
// 泛型结构体
func genericStruct() {
    struct Stack<E> {
        var array = [E]()
        
        mutating func push(_ element: E) {
            array.append(element)
        }
        
        @discardableResult mutating func pop() -> E {
            return array.removeLast()
        }
        
        var size: Int {
            return array.count
        }
        
        func show() {
            print("stack:", terminator:" ")
            for item in array {
                print(item, terminator:" ")
            }
            print("")
        }
    }
    
    var intStack = Stack<Int>() // 需要标明Int，否则Stack无法知道泛型T的类型
    let array = [1,2,3,4]
    intStack = Stack(array: array) // 需要标明Int，Stack可以通过array的元素类型知道泛型T的类型为Int
    intStack.show()
    let count = intStack.size
    for _ in 1...count {
        intStack.pop()
        intStack.show()
    }
}
genericStruct()

// 泛型枚举类型
func genericEnum() {
    enum Score<T> {
        case point(T)
        case grade(String)
    }

    var score1 = Score.point(88)
    score1 = Score.grade("A")
    var score2 = Score<Double>.grade("B") // 必须提供泛型类型Double，否则无法知道枚举变量中泛型T的类型
    score2 = Score.point(88.5)
}
genericEnum()

