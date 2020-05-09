//
//  main.swift
//  04 override_type_method
//
//  Created by void on 2020/5/8.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 重写类方法
 重写类下标
 */

class Animal {
    class func speak() {
        print("animal speak")
    }
    class subscript(index: Int) -> Int {
        print("animal subscript")
        return index
    }
}

class Dog: Animal {
    override class func speak() {
        super.speak()
        print("dog speak")

    }
    override class subscript(index: Int) -> Int {
        print("dog subscript")
        return super[index] + 1
    }
}
Animal.speak()
print("-----")
print(Animal[1])
print("-----")
Dog.speak()
print("-----")
print(Dog[1])
