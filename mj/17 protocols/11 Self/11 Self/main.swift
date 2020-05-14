//
//  main.swift
//  11 Self
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol Runable {
    func test () -> Self
}

class Animal: Runable {
    var age = 0
    required init () {
        
    }
    func test() -> Self {
        return type(of: self).init()
    }
}

class Dog: Animal {
    static var count = 0
    
    func show() {
        print(self.age)
        print(Self.count)
    }
}

let animal = Animal()
print(animal.test())

let dog = Dog()
print(dog.test())
