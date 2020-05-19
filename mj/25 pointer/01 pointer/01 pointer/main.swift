//
//  main.swift
//  01 pointer
//
//  Created by void on 2020/5/19.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 指针
 Swift中也有专门的指针类型，这些都被定性为Unsafe(不安全的)，常见的有以下4种类型
 - UnsafePointer<Pointee>类似于 const Pointee *
 - UnsafeMutablePointer<Pointee>类似于 Pointee *
 - UnsafeRowPointer<Pointee>类似于 const void *
 - UnsafeMutablePointer<Pointee>类似于 void *
 */

var age = 1
func test1(_ ptr: UnsafePointer<Int>) {
    print(ptr.pointee)
}
func test2(_ ptr: UnsafeMutablePointer<Int>) {
    ptr.pointee += 1
}
func test3(_ num: inout Int) {
    num += 1
}
func test4(_ ptr: UnsafeRawPointer) {
    print(ptr.load(as: Int.self))
}
func test5(_ ptr: UnsafeMutableRawPointer) {
    ptr.storeBytes(of: 4, as: Int.self)
}

test1(&age)
test2(&age)
print(age)
test3(&age)
print(age)
test4(&age)
test5(&age)
print(age)

/*
 ##### 指针的应用实例
 */
var array = NSArray(objects: 1, 2, 3, 4)
array.enumerateObjects { (item, idx, stop) in
    print(idx, item)
    if idx == 2 {
        stop.pointee = true
    }
}

for (idx, item) in array.enumerated() {
    print(idx, item)
    if idx == 2 {
        break
    }
}
