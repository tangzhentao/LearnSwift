//
//  main.swift
//  02 auto_initializer_inheritance
//
//  Created by void on 2020/5/10.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

func autoInheritance() {

    class Person {
        var age: Double = 0
        var name:String
        
        init(age: Double, name: String) {
            self.name = name
            self.age = age
        }
        
        convenience init(age: Double) {
            self.init(age: age, name:"")
        }
        
        required convenience init(name: String) {
            self.init(age: 0, name:name)
        }
        
        required init() {
            age = 0
            name = ""
        }
    }
    
    class Student: Person {
        var sid: Int = 0
        
        init(age: Double, name: String, sid: Int) {
            self.sid = sid
            super.init()
        }
        
        required convenience init() {
            self.init(name: "")
        }
        
        convenience init(sid: Int) {
            self.init()
            self.sid = sid
        }
        
        required init(name: String) {
            super.init()
            
        }
    }
    
//    var s = Student()
//    s = Student(age: 2)
//    print(s.sid)
}
autoInheritance()
