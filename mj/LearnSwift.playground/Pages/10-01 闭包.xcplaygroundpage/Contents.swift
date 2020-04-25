//: [Previous](@previous)

import Foundation

// 闭包表达式
var add = {
    (a: Int, b: Int) -> Int in
    return a + b
}

let result = add(1, 2)
print("result:", result)

// 匿名闭包
/*
匿名闭包，老是报错
 { (a: Int, b:Int) in print("hello")
 }(1, 2)
*/


//: [Next](@next)
