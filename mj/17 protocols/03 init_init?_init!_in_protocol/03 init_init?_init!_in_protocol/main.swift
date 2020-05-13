//
//  main.swift
//  03 init_init?_init!_in_protocol
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol InitProtocol {
    init(age: Int)
    
    func show()
}

struct Cat: InitProtocol {
    var age: Int
    init!(age: Int) {
        if age < 0 {
            return nil
        }
        self.age = age
    }
    
    func show() {
        print("cat \(age) years.")
    }
}

class Dog: InitProtocol {
    var age: Int
    required init!(age: Int) {
        if age < 0 {
            return nil
        }
        self.age = age
    }
    
    func show() {
        print("dog \(age) years.")
    }
}

var cat = Cat(age: 2)
cat?.show()
cat = Cat(age: -1)
cat?.show()
var dog = Dog(age: 3)
dog?.show()
