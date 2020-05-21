//
//  main.swift
//  02 pointer_variable
//
//  Created by void on 2020/5/20.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 获取某个变量的指针
 withUnsafeMutablePointer获取的是传入的变量的地址
 如果变量是类实例变量，获取的到地址是该变量的地址，并不是类实例在堆中的地址
 */
var i = 2
var iPtr = withUnsafeMutablePointer(to: &i) { $0}
print("iPtr:", iPtr)
iPtr.pointee = 4
print("i:", i)

// 用特定类型的指针返回一个原始数据的指针
var rawPtr = withUnsafeMutablePointer(to: &i) { UnsafeMutableRawPointer($0) }
// 向原始数据中写入指定类型数据
rawPtr.storeBytes(of: 6, as: Int.self)
print("i:", i)
// 向原始数据中读取指定类型数据
print("raw data:", rawPtr.load(as: Int.self))

/*
 ##### 获取指向堆空间实例的指针
 */
class Cat {
    var age = 2
}

// tom其实是个指针变量，tom中存储的是tom实例在堆空间的地址
var tom = Cat()
// tomPtr变量的值是tom指针变量的地址
var tomPtr = withUnsafeMutablePointer(to: &tom) { $0 }
print("tomPtr:", tomPtr)

/* 获取指向Cat实例的指针变量 */
var tomRawPtr = withUnsafeMutablePointer(to: &tom) { UnsafeMutableRawPointer($0) }
print("tomRawPtr:", tomRawPtr)
var tomObjAddressInt = tomRawPtr.load(as: UInt.self)

print("tomObjAddressInt:", tomObjAddressInt)
var tomObjAddress = UnsafeRawPointer(bitPattern: tomObjAddressInt) // 返回的是可选类型，因为不是传入的Int可能是无效的地址
print("tomObjAddress:", tomObjAddress as Any)

print("for breakpoint")
