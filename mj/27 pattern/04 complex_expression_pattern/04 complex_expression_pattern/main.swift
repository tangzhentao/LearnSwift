//
//  main.swift
//  04 complex_expression_pattern
//
//  Created by void on 2020/5/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
##### 自定义表达式模式：比较大小
*/

//func greaterThan(_ num: Int) -> (Int)->Bool {
//    return {
//        (x: Int) -> Bool in
//        return x > num
//    }
//}
//
//extension Int {
//    static func ~=(pattern: (Int) -> Bool, value: Int) -> Bool {
//        pattern(value)
//    }
//}
//
//func check(_ num: Int) {
//    switch num {
//    case greaterThan(5): // 传入模式的是greaterThan(5)的执行的结果：一个(Int)->Bool的闭包表达式
//        print(num, "大于5")
//    default:
//        break
//    }
//}
//check(4)
//check(5)
//check(6)

prefix operator <==
prefix operator >==

prefix func <==(_ num: Int) -> (Int)->Bool {
    return {
        (x: Int) -> Bool in
        return x <= num
    }
}
prefix func >==(_ num: Int) -> (Int)->Bool {
    return {
        (x: Int) -> Bool in
        return x >= num
    }
}

extension Int {
    static func ~=(pattern: (Int) -> Bool, value: Int) -> Bool {
        pattern(value)
    }
}

func checkNum(_ num: Int) {
    switch num {
    case <==10: // 传递给模式的是前缀运算符的执行结果:(Int)->Bool闭包表达式
        print(num, "小于等于10")
    case >==11: // 传递给模式的是前缀运算符的执行结果:(Int)->Bool闭包表达式
        print(num, "大于等于11")
    default:
        break
    }
}
checkNum(9)
checkNum(10)
checkNum(11)
checkNum(12)
