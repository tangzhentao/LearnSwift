//
//  main.swift
//  01 memory_management
//
//  Created by void on 2020/5/19.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 内存管理
 - 跟OC一样，swift也是采用基于引用计数的ARC内存管理方案(针对堆空间)
 **Swift的ARC有3种引用**
 - 强引用(srong reference): 默认情况下都是强引用
 - 弱引用(weak reference): 通过weak定义弱引用
 弱引用必须是可选类型的var，因为ARC会自定将弱引用置nil，所有弱引用必须是可变的、必须是可为nil的
 ARC自动给你弱引用置nil时，不会触发属性观察器
 - 无主引用(unowned reference): 通过unowned定义无主引用
 不会产生强引用，实例销毁后仍然存储着实例的地址，不会被置nil(类型于oc的unsafe_unretained)
 试图在实例被销毁后访问无主引用会产生运行时错误(访问野指针)
 Fatal error: Attempted to read an unowned reference but object 0x100439fa0 was already deallocated
 */

class Cat {
    var age: Int
    init(age: Int) {
        self.age = age
    }
    deinit {
        print("deinit: cat -", age)
    }
}

print(1)
do {
    var cat1 = Cat(age: 1)
} // 此处释放cat
var cat2: Cat? = Cat(age: 2)
cat2 = nil // 测试释放cat
print(2)

weak var cat3 = Cat(age: 3) // 刚生产就释放, cat3其实是个cat？
print(cat3)
//weak var cat4: Cat = Cat(age: 4) // 报错：weak类型必须是可选类型
weak var cat4: Cat? = Cat(age: 4)
print(cat4)

class House {
    var owner: Person? = Person()
}

class Person {
    weak var cat: Cat? = nil {
        willSet {
            print("will set cat")
        }
        didSet {
            print("did set cat")
        }
    }
    
    deinit {
        print("deinit person")
    }
}

var jim: Person? = Person()
print("-----")
do {
    
    let cat5 = Cat(age: 5)
    jim?.cat = cat5
    print("jim cat:", jim?.cat as Any)
} // 此处jim的cat属性被自动置nil时不会触发cat的属性观察器
print("jim cat:", jim?.cat as Any)

/* 无主引用 */
print("\n无主引用")
unowned var cat6: Cat = Cat(age: 6)
//print(cat6) // 运行时错误
print(1)

/*
 #### weak、unowned的使用限制
 - weak、unowned只能在类实例上使用
 */
protocol Living: AnyObject {} // 类协议
class Dog {}

weak var p0: Person?
weak var p1: AnyObject?
weak var p2: Living?

unowned var s0: Person?
unowned var s1: AnyObject?
unowned var s2: Living?

/*
#### Autoreleasepool
- weak、unowned只能在类实例上使用
*/

autoreleasepool {
    let cat7 = Cat(age: 7)
    let _ = cat7.age
}
