//
//  main.swift
//  03-02内敛函数
//
//  Created by itang on 2020/2/11.
//  Copyright © 2020 learn. All rights reserved.
//

import Foundation

/*
 调整optimization等级，观察普通函数是否转成内敛函数
 */

/*
func testInlineFunction () -> Int {
    return 1
}

let i = testInlineFunction()
*/

/* 递归函数不会转成内敛函数
func recusiveFunction (num: Int) -> Int {
    if num > 0 {
        return num + recusiveFunction(num: num - 1)
    } else {
        return num
    }
}
let result = recusiveFunction(num: 4)
print("递归相加结果为：\(result)")
*/

/* 函数体较长的函数不会转成内敛函数

func longFunction() {
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
}
longFunction()
*/

/* 动态派发的函数不会转成内敛函数 (看汇编没看出来这点😂)
class Person {
    var food = "none"
    
    func eat() {
        food = "rice"
    }
}

class Student: Person {
    var age = 6
    
    override func eat() {
        food = "egg"
    }
}

var john: Person = Person()
john = Student()
john.eat()
*/

/* inline */
/* 开启了编译优化也不会被转成内联函数

@inline(never)
func keepFunction () {
    print("never inline")
}
keepFunction()
 */

/* 即使函数体较长的函数也会被内联(在开启编译优化的前提下)
@inline(__always)
func inlineIfPossible () {
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
    print("long long long")
}
inlineIfPossible()
*/
