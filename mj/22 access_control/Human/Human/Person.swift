//
//  Person.swift
//  Human
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

open class Person {
    var age = 0
    var name = ""
    public init() {
        
    }
    
     public required init(age: Int) {
        self.age = age
    }
    
    open func run() { // 要想被其他模块的子类chongxie
        print("person run")
    }
}
