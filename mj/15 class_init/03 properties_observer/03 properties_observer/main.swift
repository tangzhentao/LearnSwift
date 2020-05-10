//
//  main.swift
//  03 properties_observer
//
//  Created by void on 2020/5/10.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 属性观察器，在子类的初始化器中赋值会触发 */
func propertiesObserser() {

    class Person {
        var age: Double {
            willSet {
                print("will set age")
            }
            didSet {
                print("did set age: \(oldValue) -> \(age)")
            }
        }
        var name:String
        
        init(age: Double, name: String) {
            self.name = name
            self.age = age
        }
    }
    
    class Student: Person {
        var sid: Int
        
        init(age: Double, name: String, sid: Int) {
            self.sid = sid
            super.init(age: age, name: name)
            
            print("Student init: age")
            self.age = age + 1
        }
    }
    var _ = Student(age: 2, name: "jim", sid: 1)
    
}
propertiesObserser()

