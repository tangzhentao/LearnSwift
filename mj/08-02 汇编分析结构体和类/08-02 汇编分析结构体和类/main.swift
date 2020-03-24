//
//  main.swift
//  08-02 汇编分析结构体和类
//
//  Created by void on 2020/3/20.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

func testStructClass() {

    struct Point1 {
        var x = 0
        var y = 0
    }

    class Size {
        var w = 0
        var h = 0
        var isZero = false
    }

    let p = Point1()
    var s = Size()

    // Size指针变量本身的大小
    print("Size pointer's size:",MemoryLayout<Size>.size) // 8
    print("Size pointer's size:",MemoryLayout.size(ofValue: s)) // 8
    // Size对象的大小
    print("Size instance size:", class_getInstanceSize(Size.self)) // 40
    print("Size instance size:", class_getInstanceSize(type(of: s))) // 40

    /*
     有问题，本来打印的结果应该是40，结果为0，后续再看
    let ptr = withUnsafePointer(to: &s) { (ps) -> UnsafePointer<Size> in
        ps
    }
    print("ptr指向的内存大小为:", malloc_size(ptr))
    */

}

/*
 在Mac或iOS平台上，malloc分配的内存大小是16的倍数，至少分配16字节；
 */
func testMalloc () {
    // 想堆空间申请大小为1字节的内存
    let ptr = malloc(1)
    print("ptr指向内存的大小：", malloc_size(ptr)) // 结果会获取到大小为16字节的内存
}

/*
 测试值类型赋值操作
 */
func testVauleTypeAssignment () {
    print("")
    print("测试值类型")
    
    struct Point {
        var x = 0
        var y = 0
    }
    
    let p1 = Point(x: 1, y: 2)
    var p2 = p1
    p2.x = 3
    print("p1", p1)
    print("p2", p2)
    
    // 数组
    var array1  = [1, 2, 3]
    var array2 = array1
    array1.append(1)
    array2.append(2)
    print("array1:", array1)
    print("array2:", array2)
    
    // 字典
    let dict1: [String : Any] = ["name" : "tom", "age" : 11]
    var dict2 = dict1
    dict2["name"] = "jim"
    dict2["age"] = 22
    print("dict1:", dict1)
    print("dict2:", dict2)
}

// 修改原有的内存
func testModifyOriginalMemory () {
    struct Point {
        var x = 0
        var y = 0
    }
    
    var point = Point(x: 1, y: 2)
    var ptr = withUnsafePointer(to: &point) { (p) -> UnsafePointer<Point> in
        p
    }
    print("point地址:", ptr) // 0x00007ffeefbff460
    point.x = 3 // 修改原有的内存
    ptr = withUnsafePointer(to: &point) { (p) -> UnsafePointer<Point> in
        p
    }
    print("point地址:", ptr) // 0x00007ffeefbff460
    point = Point(x: 4, y: 5) // 修改原有的内存
    ptr = withUnsafePointer(to: &point) { (p) -> UnsafePointer<Point> in
        p
    }
    print("point地址:", ptr) // 0x00007ffeefbff460
}


/*
 本来想验证Copy On Write
 没想到验证办法
 */
func testCopyOnWrite() {
    var array1 = [1, 2, 3]
    var array2 = array1
    
    print("hello")
}

testStructClass()
testMalloc ()
testVauleTypeAssignment ()
testModifyOriginalMemory ()
testCopyOnWrite()
