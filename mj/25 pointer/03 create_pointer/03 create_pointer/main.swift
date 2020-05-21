//
//  main.swift
//  03 create_pointer
//
//  Created by void on 2020/5/20.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 创建指针
 */


/* C语言方式创建 */
// 创建
var ptr = malloc(16)
// 存
ptr?.storeBytes(of: 8, as: Int.self)
ptr?.storeBytes(of: 10, toByteOffset: 8, as: Int.self)
// 取
print("pointee:", ptr?.load(fromByteOffset: 0, as: Int.self) ?? 0)
print("pointee:", ptr?.load(fromByteOffset: 8, as: Int.self) ?? 0)
// 释放
free(ptr)

/* Swift方式创建 */
do {
    // 创建
    let ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
    // 存
    ptr.storeBytes(of: 1, as: Int.self)
    ptr.advanced(by: 8).storeBytes(of: 2, as: Int.self)
    // 取
    print("pointee:", ptr.load(as: Int.self))
    print("pointee:", ptr.advanced(by: 8).load(as: Int.self))
    // 释放
    ptr.deallocate()
}

/* 创建指针并初始化 */
do {
    // 创建
    let ptr = UnsafeMutablePointer<Int>.allocate(capacity: 3) // ptr类似于C语言的数组指针
    // 初始化
    ptr.initialize(repeating: 0, count: 3)
//    ptr.initialize(to: 10)
//    ptr.successor().initialize(to: 11)
//    ptr.successor().successor().initialize(to: 12)
    
    // 存
//    (ptr + 0).pointee = 10
//    (ptr + 1).pointee = 11
//    (ptr + 2).pointee = 12
    
    ptr[0] = 10
    ptr[1] = 11
    ptr[2] = 11
//    ptr[3] = 11 // 越界有可能运行时报错，也有可能不报错

    
    // 取
    print("index 0:", ptr[0])
    print("index 1:", ptr[1])
    print("index 2:", ptr[2])
//    print("index 3:", ptr[3])  // 越界有可能运行时报错，也有可能不报错

    // deinit
    ptr.deinitialize(count: 3)
    // 释放
    ptr.deallocate()
}

/* 为啥要deinitialize
 感觉如果存储的是引用类型的话，需要调用deinitialize
 */
class Cat {
    var age: Int
    init(_ age: Int) {
        self.age = age
    }
    deinit {
        print("deinit cat:", age)
    }
}
do {
    // 存放的是Cat实例的指针
    let ptr = UnsafeMutablePointer<Cat>.allocate(capacity: 2)
//    ptr.initialize(to: Cat(2))
//    ptr.successor().initialize(to: Cat(3))
    ptr[0] = Cat(2)
    ptr[1] = Cat(3)
    ptr.deinitialize(count: 2) // 没有这行代码，创建的cat实例不会被释放

    print(MemoryLayout.stride(ofValue: ptr))

    ptr.deallocate()
}
