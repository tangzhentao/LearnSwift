//
//  main.swift
//  02 Associated_Type
//
//  Created by void on 2020/5/15.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol Stackable {
    associatedtype E
    mutating  func push(_ element: E)
    mutating func pop() -> E
    var size: Int {get}
}

class IntStack: Stackable {
    
//    typealias E = Int // 可以省略，因为下面的代码可以推测出关联类型E的类型为Int
    var array: [Int]
    init() {
        array = [Int]()
    }
    init(_ array: [Int]) {
        self.array = array
    }
    func push(_ element: Int) {
        array.append(element)
    }
    func pop() -> Int {
        array.removeLast()
    }
    var size: Int {
        return array.count
    }
}

class Stack<T>: Stackable {
    
//    typealias E = T  // 可以省略，因为下面的代码可以推测出关联类型E的类型为泛型T
    var array: [T]
    init() {
        array = [T]()
    }
    init(_ array: [T]) {
        self.array = array
    }
    func push(_ element: T) {
        array.append(element)
    }
    func pop() -> T {
        array.removeLast()
    }
    var size: Int {
        return array.count
    }
}




