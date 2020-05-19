//
//  main.swift
//  05 conflicting_asscess_to_memory
//
//  Created by void on 2020/5/19.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 内存访问冲突
 内存访问冲突在两个访问满足下列两个条件时发生：
 - 它们访问的是同一个块内存
 - 它们的访问时间重叠(比如在同一个函数内)
 */

// 不是内存访问冲突的情况
func plus(_ num: inout Int) -> Int {
    num + 1
}
var num = 1
num = plus(&num)

// 是内存访问冲突的情况、
var step = 1
func increment(_ num: inout Int) {
    print(step)
    print(num)
}
//increment(&step) // 运行时错误

func balance(_ x: inout Int, _ y: inout Int) {
//    let sum = x + y
//    x = sum / 2
//    y = sum - x
    print(x)
    print(y)
}
var x = 3
var y = 4
balance(&x, &y) // ok
//balance(&x, &x) // 编译错误

var tulpe = (health: 10, energy: 20)
//balance(&tulpe.health, &tulpe.energy) // 没有写操作同样报内存访问冲突的错误

print("over")

/*
 如果下面的条件可以满足，就说明重叠访问结构体的属性是安全的
 - 你只访问实例存储属性，不是计算属性或类属性
 - 结构体是局部变量而非全局变量
 - 结构体要么没有被闭包捕获，要么只被逃逸闭包捕获
 */
func balance1(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
do {
    var tulpe = (health: 10, energy: 20) //局部变量，没有报访问冲突错误
    balance1(&tulpe.health, &tulpe.energy)
}
