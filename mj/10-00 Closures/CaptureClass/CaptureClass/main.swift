//
//  main.swift
//  CaptureClass
//
//  Created by void on 2020/4/28.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation
/*
 探寻 闭包 捕获类对象的情况
 */

print("03")


class Person {
    var age = 0
    
    init(age: Int) {
        self.age = age
    }
}

typealias AddFunc = (Int) -> Int

func getFn() -> AddFunc {
    let jobs = Person(age: 38)
    let bill = Person(age: 40)

    func addAge(a: Int) -> Int {
        let newAge = jobs.age + a + bill.age
        return newAge
    }
    
    return addAge
}

let addFn = getFn()
let age = addFn(2)
print(age)


