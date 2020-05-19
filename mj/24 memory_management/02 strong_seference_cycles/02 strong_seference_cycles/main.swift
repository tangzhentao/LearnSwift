//
//  main.swift
//  02 strong_seference_cycles
//
//  Created by void on 2020/5/19.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation
/*
 ##### 循环引用
 - weak、unowned都能解决循环引用问题，unowned要比weak少一丢丢性能消耗
 - 在生命周期中可能为nil的使用weak
 - 初始化后再也不会变成nil的使用unowned
 */

class House {
    var owner: Person? = nil
    deinit {
        print("deinit: house")
    }
}

class Person {
    weak var house: House? = nil
    deinit {
        print("deinit: person")
    }
}

/* 属性互相引用 */
do {
    let jim = Person()
    let house = House()
    jim.house = house
    house.owner = jim
}

class Cat {
    var fn: (() -> ())? // 此处不能使用 weak、unowned
    func run() {
        print("run")
    }
    
    deinit {
        print("deinit cat")
    }
}

/*
 ##### 闭包造成的循环引用
 - 闭包表达式默认会对用到的外层对象产生强引用
 - 在闭包表达式的捕获列表声明weak或unowned引用解决循环引用问题
 */

/* 实例与闭包互相引用
 
 debug混编代码发现
 init 一下
 retain 一下
 release 一下
 最终引用计数为1
 */
func test() {
    print("test")
    let c = Cat()
    c.fn = {
        c.run()
    }
    let i = 2
}
test()
/* weak捕获列表 破除实例与闭包互相引用
 debug混编代码发现
 release的次数 = init + retain的次数
 最终引用计数为0
 */
func test1() {
    print("test1")
    let c = Cat()
    c.fn = {
        [weak c] in
        c?.run()
    }
    let i = 2
}
test1()
/* unowned捕获列表 破除实例与闭包互相引用 */
func test2() {
    print("test2")
    let c = Cat()
    c.fn = {
        [unowned c] in
        c.run()
    }
}
test2()


/*
 ##### 闭包的循环引用
 - 如果想在定义闭包属性的同时引用self，这个闭包必须是lazy的
 因为在实例初始化完成后才能访问self
 - 闭包内部如果用到了实例成员，编译器会强制要求明确写出self
 - 如果lazy属性是闭包调用的结果，那么不用考虑循环引用的问题
 因为闭包调用后，闭包的生命周期就结束了
 */
do {
    class Person {
        var age:Int
        lazy var fun = {
            self.run() // 闭包表达式中，捕获了self，要明确标明self
        }
        func run() {
            print("rum")
        }
        init(age: Int) {
    //        self.fun() // 报错，实例还没有完成初始化
            self.age = age
    //        self.fun() // 放在这里是可以的
        }
        
        deinit {
            print("deinit person", age)
        }
    }
    
    let jim = Person(age: 20)
    jim.run()
//    jim.fun() // 执行这行代码造成了循环引用，因为闭包捕获了self
}


class Student {
    var age:Int
    lazy var count = {
        return getCount() // 闭包表达式中，捕获了self，然后立即又释放了，
    }()
    func run() {
        print("rum")
    }
    init(age: Int) {
        self.age = age
    }
    
    func getCount() -> Int {
        return 2
    }
    
    deinit {
        print("deinit student", age)
    }
}

do {
    let jim = Student(age: 10)
    print(jim.count)
}

