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
    required init () {
        
    }
    func test() -> Self {
        return type(of: self).init()
    }
}

class Dog: Animal {
    
}

let animal = Animal()
print(animal.test())

let dog = Dog()
print(dog.test())
