//
//  main.swift
//  01 pattern
//
//  Created by void on 2020/5/24.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 通配符模式
 - _匹配任何值
 - _? 匹配非nil值
 */

enum Life {
    case human(name: String, age: Int?)
    case animal(name: String, age: Int?)
}

func check(_ life: Life) {
    switch life {
    case let .human(name, _):
        print("human:", name)
    case let .animal(name, _?):
        print("animal:", name)
    default:
        print("other")
    }
}

var life = Life.animal(name: "tom", age: 2)
check(life)
life = Life.animal(name: "tom", age: nil)
check(life)
life = Life.human(name: "jim", age: 8)
check(life)
life = Life.human(name: "jim", age: nil)
check(life)

/*
##### 标识符模式
- 给对应的变量、常量赋值
*/
var age = 10
let name = "jim"

/*
##### 值绑定模式
*/
let point = (2, 2)
switch point {
case let (x, y):
    print(x, y)
}
/*
##### 元组模式
*/
let points = [(0,0), (1, 0), (2, 0)]
for (x, _) in points {
    print(x)
}

let nm: String? = "jim"
let ag = 10
let info: Any = [1, 2]
switch (nm, ag, info) {
case (_?, _, _ as String): // nm非空、ag值任意、info可以转成String
    print("bingo")
default:
    print("other")
}

var scores = ["jack": 99, "rose": 100, "kate" : 88]
for (name, score) in scores {
    print(name, score)
}

/*
##### 枚举Case模式
 - if case 语句等价于只有1个case的switch语句
*/

// 判断值是否在区间[0, 9]中
do {
    let age = 2
    // 使用比价大小
    if age >= 0 && age <= 9 {
        print("[0, 9]")
    }
    // 使用模式匹配
    if case 0...9 = age {
        print("[0, 9]")
    }
    // 等价于
    switch age {
    case 0...9:
        print("[0, 9]")
    default:
        break
    }
    
    let ages: [Int?] = [2, 3, nil, 5, nil]
    // 遍历数组points， 匹配其值为nil的情况
    for case nil in ages {// 意思是：遍历数组ages中的值， 拿数据元素与nil比较，如果相等执行下面的语句，不等则继续遍历下一个元素
        print("有nil值") // 执行两次
    }
    
    let points = [(1, 0), (2, 1), (3, 0)]
    
    // 遍历数组points， 匹配y为0的情况，打印其x的值
    for case let (x, 0) in points {
        print(x)
    }
    
    var num: Int? = 10
    switch num {
    case let x?: // 如果不为nil，匹配到这个模式，且解包赋值给x
        print(x)
    case nil:
        print("nil")
    }
    // 等价于下面的代码
    switch num {
    case .some(let x):
        print(x)
    case .none:
        print("nil")
    }

}

/*
 ##### 可选模式
 */
do {
    let age: Int? = 22
    // 如果age不为空，则返回true，并把值解包赋给x
    if case .some(let x) = age {
        print(x)
    }
    // 等价于
    if case let x? = age {
        print(x)
    }
    
    // 遍历数组ages，如果元素不为nil，则解包赋值给x，并执行下面的代码
    let ages: [Int?] = [nil, 2, 3, nil, 5]
    for case let x? in ages {
        print(x)
    }
    // 等价于
    for item in ages {
        if let x = item {
            print(x)
        }
    }
}
func check(_ num: Int?)  {
    switch num {
    case 2?: print(2) // 匹配不为nil，且值为2的情况
    case 4?: print(4) // 匹配不为nil，且值为4的情况
    case _?: print("other") // 匹配不为nil的情况
    case _: print("nil") // 匹配剩下的所有情况，即nil的情况
    }
}

check(2)
check(3)
check(4)
check(nil)

/*
 ##### 类型转换模式
 */
var num: Any = 6
func typeCast(_ num: Any) {
    switch num {
    case is Int:
        print(num, "is Int") // 此处编译器仍然认为num是Any类型
    default:
        print(num, "is not Int")
    }
}
typeCast(num)
num = 8.9
typeCast(num)

class Animal {
    func eat() {
        print(type(of: self), "eat")
    }
}
class Dog: Animal {
    func run()  {
        print(type(of: self), "run")
    }
}
class Cat: Animal {
    func jump()  {
        print(type(of: self), "jump")
    }
}

func animalTypeCast(_ animal: Animal) {
    switch animal {
    case let dog as Dog:
        dog.eat() // 此处编译器认为，dog是Dog类型，animal是Animal类型
        dog.run()
    case is Cat:
        animal.eat()
//        animal.jump() // 此处编译器认为animal是Animal类型，所以不能调用Cat的jump方法
    default:
        break
    }
}
animalTypeCast(Dog())
animalTypeCast(Cat())
