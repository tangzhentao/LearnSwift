//
//  main.swift
//  06 deinitialization
//
//  Created by void on 2020/5/10.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 反初始化器 */
func propertiesObserser() {

    class Person {
        var name:String
        var age: Double
        
        init(name: String, age: Double) {
            self.name = name
            self.age = age
        }
        deinit {
            print("Person deinit")
        }
    }
    
    
    class Student: Person {
        var sid: Int

        init(age: Double, name: String, sid: Int) {
            self.sid = sid
            super.init( name: name, age: age)
        }
        deinit {
            print("Student deinit")
        }
    }
    
    var s: Person? = Student(age: 2, name: "jim", sid: 1)
    s = nil
    print("function end")
}
propertiesObserser()

