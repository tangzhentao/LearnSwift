//
//  main.swift
//  01 MemoryLayout
//
//  Created by void on 2020/5/7.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 子类的内存中包含父类的存储实例属性
 */
print("Hello, World!")
class Animal {
    var age = 0
}

class Dog: Animal {
    var weight = 0
}

class ErHa: Dog {
    var IQ = 0
}

let a = Animal()
print("animal size:", MemoryLayout<Animal>.size)

// 需要获取到对象的指针 才能看实例内存大小
