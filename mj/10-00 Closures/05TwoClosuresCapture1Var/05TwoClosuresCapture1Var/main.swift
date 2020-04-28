//
//  main.swift
//  05TwoClosuresCapture1Var
//
//  Created by void on 2020/4/28.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
探究两个闭包捕获同一个变量的情况

结论
两个闭包使用该局部变量的同一份堆空间变量
*/

print("05")

typealias IntToIntFn = (Int) -> Int

func getFn() -> (IntToIntFn, IntToIntFn) {
    var num1 = 2

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
var result =  a(2)
print(result) // 4
result =  s(2)
print(result) // 2
