//
//  main.swift
//  07 swift_call_oc
//
//  Created by void on 2020/5/26.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### swift 调用OC代码
 需要为OC代码新建一个桥接文件，用于把OC的头文件暴露给Swift，暴露的这些头文件，就是Swift中能访问的内容；
 新建这个桥接文件有两种方式：
 - 在Swift项目中新建OC文件时，让xcode自动创建
 - 自己手动创建，文件名格式为：{target_name}-Bridging-Hearder.h
 */

func sum(_ x: Int, _ y: Int) -> Int {
    return x + y + y
}

class Person {
    var age = 0
    var name = ""
    
    func greet() {
//        print("hello, everyone")
    }
}

let jim = Person()
jim.greet() // 调用函数用的是函数地址绑定

var tom = Cat(name: "tom", age: 1) // 先调用实例方法，如果定义中没有暴露或者没有实例方法，再去调用类方法
tom.greet("jim") // 调用函数用的是消息传递机制
Cat.greet("老鼠")

tom.eat("猫粮", other: "睡大觉")
Cat.eat("老鼠", other: "睡大觉")

print(sub(1, 2))
var result = sum(1, 2) // 调用的是当前文件的sum，而不是OC的sum
print("加法结果", result)

/*
 ##### @_silgen_name()
 标记把给定的函数重新声明为别的名字
 - 用于解决名字冲突，如果暴露给Swift的OC中的C函数名和Swift中的函数名冲突了
 - @_silgen_name还可以用于调用系统的私有函数
 */
@_silgen_name("sum")
func oc_sum(_ a: Int32, _ b: Int32) -> Int32
print(oc_sum(1, 2))
