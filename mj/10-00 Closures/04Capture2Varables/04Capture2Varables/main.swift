//
//  main.swift
//  04Capture2Varables
//
//  Created by void on 2020/4/28.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 探究闭包捕获两个变量的情况
 
 结论
 用一个堆空间变量包含这两个要捕获的局部变量；
 */


//class Person {
//    var age = 0
//
//    init(age: Int) {
//        self.age = age
//    }
//}

print("04")

typealias IntToIntFn = (Int) -> Int

func getFn() -> IntToIntFn {
    var num1 = 2
    var num2 = 3

    func add(a: Int) -> Int {
        
        let result = num1 + num2 + a
        return result
    }
    return add
}

let a = getFn()
let result =  a(2)


/*
 print("03")

 typealias IntToIntFn = (Int) -> Int

 func getFn() -> (IntToIntFn, IntToIntFn) {
     var num1 = 0

     func add(a: Int) -> Int {
         num1 += a
         return num1
     }
     
     func sub(a: Int) -> Int {
         num1 -= a
         return num1
     }
     
     return (add, sub)
 }

 let (a, s) = getFn()
 a(2)
 s(2)
 */
