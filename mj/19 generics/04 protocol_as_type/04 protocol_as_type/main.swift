//
//  main.swift
//  04 protocol_as_type
//
//  Created by void on 2020/5/15.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

// 协议作为类型
protocol Living {
    func breathe()
}

class Cat: Living {
    func breathe() {
        print("Cat breathe")
    }
    var age = 0
}

class Dog: Living {
    typealias Speed = Double
    func breathe() {
        print("Dog breathe")
    }
}

var pet: Living
pet = Cat()
pet = Dog()

func getLiving(_ index: Int) -> Living {
    if 0 == index {
        return Cat()
    } else {
        return Dog()
    }
}

let liver = getLiving(0)
liver.breathe()

// 协议作为泛型类型约束
class Stack<T: Living> {
    
}

protocol Runalbe {
    associatedtype Speed
    var speed: Speed { get }
    func run()
}

//var a: Runalbe // 报错

func getLive() -> some Living {
    return Cat()
}




