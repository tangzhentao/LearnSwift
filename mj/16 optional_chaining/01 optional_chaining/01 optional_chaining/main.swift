//
//  main.swift
//  01 optional_chaining
//
//  Created by void on 2020/5/10.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 可选链 */

func getName() -> String {
    print("call getName")
    return "jim"
}

func optional() {
    class Car {
        var price: Int {
            print("Car price")
            return 100
        }
    }
    class Dog {
        var weight = 0
    }
    class Person {
        var name: String = ""
        var dog: Dog = Dog()
        var car: Car? = Car()
        
        func age() -> Int {
            18
        }
        
        func eat() {
            print("Peason eat")
        }
        
        subscript(index: Int) -> Int { return index }
    }
    
    var person: Person? = Person()
    var age = person?.age()
    var name = person?.name
    var index = person?[6]
    var price = person?.car?.price

    if let _ = person?.eat() {
        print("调用eat成功")
    } else {
        print("调用eat失败")
    }
    person?.name = getName()

    print("age", age) // Optional()
    print("name", name)// Optional()
    print("index", index)// Optional()
    
    print("****** person = nil ******")
    
    person = nil
    age = person?.age()
    name = person?.name
    index = person?[6]
    if let _ = person?.eat() {
        print("调用eat成功")
    } else {
        print("调用eat失败")
    }
    
    print("age", age) // nil
    print("name", name)// nil
    print("index", index)// nil
    
    person?.name = getName() // 不会调用getName()
    price = person?.car?.price


}
optional()

/* 字典中的可选链 */
func getNum() -> Int {
    print("call getNum")
    return 100
}
func dicOptionalChaining() {
    var scores = [
        "jim": [30, 80, 70],
        "lily": [90, 80, 100],
    ]
    
    var s = scores["jim"]?[0]
    print(s ?? 0)
    
    s = scores["jack"]?[0]
    print(s ?? 0)

    
    // 8888
    print("*******")
    var num: Int? = 10
    num? = getNum()
    num = getNum()
    num = nil
    print("*******")
    num? = getNum()
    num = getNum()
    
}
dicOptionalChaining()
