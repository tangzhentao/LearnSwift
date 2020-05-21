//
//  main.swift
//  04 pointer_cast
//
//  Created by void on 2020/5/21.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 指针转换
 */

// 创建
let ptr = UnsafeMutableRawPointer.allocate(byteCount: 16, alignment: 1)
// 延迟释放
defer {
    ptr.deallocate()
}

ptr.storeBytes(of: 2, as: Int.self)
ptr.storeBytes(of: 4, toByteOffset: 8, as: Int.self)

// 当做Int：只使用了前8个字节
let intPtr =  ptr.assumingMemoryBound(to: Int.self) // UnsafeMutablePointer<Int>类型
print(intPtr.pointee) // 2

// 转成UnsafeMutablePointer<Int>类型
var intPtr2 = unsafeBitCast(ptr, to: UnsafeMutablePointer<Int>.self)
intPtr2.pointee = 3
print(intPtr2.pointee)

/*
 unsafeBitCast是忽略数据类型的强制转换，不会因为数据类型的变化改变原有内存的数据
 - 类似于C++中的reinterpret_cast
 */
intPtr2 = unsafeBitCast(ptr + 8, to: UnsafeMutablePointer<Int>.self)
print(intPtr2.pointee) // 4
let doublePtr = unsafeBitCast(ptr + 8, to: UnsafeMutablePointer<Double>.self)
print(doublePtr.pointee) // 2e-323

/*
 该变内存数据的转换
 */
let num = 4
let d: Double = Double(num)

/*
 ##### 获取引用类型的地址
 */
class Cat {
    var age: Int
    init(_ age: Int) {
        self.age = age
    }
}

let tom = Cat(4)
let objPtr = unsafeBitCast(tom, to: UnsafeRawPointer.self)
print("objPtr:", objPtr)
let age = objPtr.load(fromByteOffset: 16, as: Int.self)
print("age:", age)

