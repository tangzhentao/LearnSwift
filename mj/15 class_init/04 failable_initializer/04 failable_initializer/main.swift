//
//  main.swift
//  04 failable_initializer
//
//  Created by void on 2020/5/10.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 可失败初始化器 */
func propertiesObserser() {

    class Person {
        var name:String
        var age: Double
        
        init!(name: String, age: Double) {
            if name.isEmpty {
                return nil
            }
            self.name = name
            self.age = age
        }
        
        init(name: String) {
            self.name = name
            self.age = 1
        }
        
        convenience init(age: Double) {
            self.init(name: "", age: age) // 调用了可失败初始化器，但不用强制解包，但是这样很危险，不要这么做
        }
        
        func show() {
            print("I am", self.name)
        }
    }
    
//    class Student: Person {
//        var sid: Int
//
//        init(age: Double, name: String, sid: Int) {
//            self.sid = sid
//            super.init(age: age, name: name)
//
//            print("Student init: age")
//            self.age = age + 1
//        }
//    }
//    var _ = Student(age: 2, name: "jim", sid: 1)
    
    let p = Person(name: "jim")
//    let p1 = Person(age: 2)

    p.show()
    
}
propertiesObserser()

/* 失败链 */
func failableInitFail() {

    class Animal {
        var age: Int
        init?(age: Int) {
            print("Animal init begin")
            if age < 0 {
                return nil
            }
            
            self.age = age
            print("Animal init end")
        }
    }
    class Person: Animal {
        var name:String
        
        init?(name: String, age: Int) {
            print("Person init begin")

            if name.isEmpty {
                return nil
            }
            self.name = name
            
            super.init(age: age)
            
            print("Person init end")

        }
    }
        
    class Student: Person {
        
        var sid: Int
    
        init?(name: String, age: Int, sid: Int) {
            print("Student init begin")

            if sid < 0 {
                return nil
            }
            self.sid = sid
            
            super.init(name: name, age: age)
            
            print("Student init end")

        }
    }
    
    print("--------")
    let _ = Student(name: "jim", age: 2, sid: 1)
    let _ = Student(name: "jim", age: -1, sid: 1)

}
failableInitFail()

