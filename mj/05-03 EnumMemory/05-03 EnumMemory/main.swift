//
//  main.swift
//  05-03 EnumMemory
//
//  Created by itang on 2020/2/25.
//  Copyright © 2020 learn. All rights reserved.
//

/*
 通过汇编查看枚举对象的内存布局
 */

import Foundation

var i = 10
var s = "hello"

struct Person {
    var age = 1
    var name = "someone"
}

class Dog {
    var age = 1
    var name = "someone"
}

var john = Person()
var dog = Dog()


/* 普通枚举类型对象占1个字节，测试拥有超过256个枚举成员的枚举类型占2个字节 */
enum TestSize {
    case i1, i2, i3, i4, i5, i6, i7, i8, i9, i10, i11, i12, i13, i14, i15, i16, i17, i18, i19, i20, i21, i22, i23, i24, i25, i26
    case j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15, j16, j17, j18, j19, j20, j21, j22, j23, j24, j25, j26
    case i1a, i2a, ia3, i4a, ia5, ia6, ia7, ia8, ia9, ia10, ia11, ai12, ai13, ia14, ia15, i1a6, i1a7, ia18, ia19, ia20, ia21, ia22, ia23, ia24, ia25, i2a6
    case ib1, ib2, ib3, ib4, ib5, ib6, i7b, i8b, ib9, i1b0, bi11, ib12, ib13, i1b4, i15b, ib16, ib17, ib18, i1b9, i2b0, i2b1, ib22, ib23, ib24, i2b5, i2b6
    case ic1, ic2, ic3, ic4, ic5, ic6, i7c, i8c, i9c, ci10, ci11, ci12, ic13, i1c4, i1c5, i16c, i1c7, ic18, ic19, ic20, ic21, ic22, ic23, ci24, i25c, i2c6
    case id1, id2, id3, id4, i5d, i6d, di7, id8, i9d, id10, id11, id12, id13, id14, id15, di16, di17, id18, id19, id20, id21, id22, id23, id24, i2d5, id26
    case ie1, ie2, ie3, ie4, ie5, ie6, i7e, ie8, ie9, ie10, ei11, ei12, ei13, ei14, ei15, ei16, ei17, ei18, ie19, ie20, ie21, i2e2, i2e3, ie24, ei25, ei26
    case if1, if2, if3, if4, if5, if6, if7, if8, if9, i1f0, i1f1, i1f2, i1f3, i14f, i1f5, i1f6, i17f, i1f8, i1f9, i2f0, i2f1, i2f2, i2f3, i24f, i2f5, ife6
    case i1g, i2g, i3g, i4g, ig5, ig6, gi7, gi8, ig9, i1g0, gi11, gi12, gi13, gi14, gi15, ig16, ig17, ig18, i1g9, i2g0, i2g1, i2g2, i2g3, i2g4, i2g5, ig26
    case i1h, hi2, hi3, hi4, ih5, ih6, hi7, hi8, ih9, ih10, ih11, ih12, ih13, ih14, hi15, ih16, ih17, ih18, ih19, i2h0, i2h1, i22h, i23h, i24h, i25h, i2h6
}

print("TestSize:", MemoryLayout<TestSize>.size) // 2
print("TestSize:", MemoryLayout<TestSize>.stride) // 2
print("TestSize:", MemoryLayout<TestSize>.alignment) // 2

enum OneCase {
    case one
}
print("OneCase:", MemoryLayout<OneCase>.size) // 0
print("OneCase:", MemoryLayout<OneCase>.stride) // 1
print("OneCase:", MemoryLayout<OneCase>.alignment) // 1


enum TestEnum {
    case test1
    case test2
    case test3
}

var test = TestEnum.test1

var testPtr = withUnsafePointer(to: &test) { (p) -> UnsafePointer<TestEnum> in
    p
}
print("testPtr:", testPtr)

test = TestEnum.test2
test = TestEnum.test3

enum TestAssociatedEnum {
    case test1(Int, Int, Int, Int)
    case test2(Int, Int, Int)
    case test3(Int, Int)
    case test4(Int)
    case test5
}

var asscEnum = TestAssociatedEnum.test1(1, 2, 3, 4)
var asscEnumPtr = withUnsafePointer(to: &asscEnum) { (p) -> UnsafePointer<TestAssociatedEnum> in
    p
}
print("asscEnumPtr:", asscEnumPtr)

asscEnum = TestAssociatedEnum.test2(5, 6, 7)
asscEnum = TestAssociatedEnum.test3(8, 9)
asscEnum = TestAssociatedEnum.test4(10)
asscEnum = TestAssociatedEnum.test5

asscEnum = TestAssociatedEnum.test4(10)

switch asscEnum {
case let .test1(x, y, z, w):
    print(x, y, z, w)
case let .test2(x, y, z):
    print(x, y, z)
case let .test3(x, y):
    print(x, y)
case let .test4(x):
    print(x)
case .test5:
    print("test5")
}

print("end")
