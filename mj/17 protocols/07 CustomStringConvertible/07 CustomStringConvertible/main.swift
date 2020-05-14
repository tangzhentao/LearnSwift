//
//  main.swift
//  07 CustomStringConvertible
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible, CustomDebugStringConvertible {
    var age = 0
    var name = ""
    
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    
    var description: String {
        return "person: \(name), \(age) years old."
    }
    
    var debugDescription: String {
        return "debug-person: \(name), \(age) years old."
    }
}

let jim =  Person(age: 8, name: "jim")
print(jim) // person: jim, 8 years old.
debugPrint(jim) // debug-person: jim, 8 years old.
