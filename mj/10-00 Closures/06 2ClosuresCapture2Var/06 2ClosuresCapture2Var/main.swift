//
//  main.swift
//  06 2ClosuresCapture2Var
//
//  Created by void on 2020/4/28.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
探究两个闭包捕获相同的两个变量的情况

结论
 先为两个局部变量创建两个堆空间变量
 然后再为两个闭包创建两个堆空间变量，这两个变量都包含两个局部变量的堆空间变量
*/

//print("05")

typealias IntToIntFn = (Int) -> Int

func getFn() -> (IntToIntFn, IntToIntFn) {
    var num1 = 2
    var num2 = 3

    func add(a: Int) -> Int {
        
        num1 += a
        num2 += a

        return num1 + num2
    }
    
    func sub(a: Int) -> Int {
        
        num1 -= a
        num2 -= a

        return num1 + num2
    }
    return (add, sub)
}

let (a, s) = getFn()
var result =  a(2)
//print(result) // 8
result =  s(2)
//print(result) // 4


