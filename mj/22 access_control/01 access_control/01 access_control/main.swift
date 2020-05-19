//
//  main.swift
//  01 access_control
//
//  Created by void on 2020/5/17.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 访问控制 */

/* 一个实体不可以被更低访问级别的实体定义 */
var s = Size(w: 1, h: 2)

class Person {
    
}

fileprivate typealias MyPerson = Person

private typealias MyInt = Int

private // 用其他访问权限都会报错
enum Score {
    case point(MyInt)
}

private // 用其他访问权限都会报错
class Cat {
    var age: MyInt = 0
}

/* 元祖类型
 元祖类型的访问权限是所有成员类型的访问权限中最低的那个权限
 */
struct Dog { }
fileprivate class Ant {}

// (Dog, Ant)的访问权限是fileprivate
fileprivate var data1: (Dog, Ant)
private var data2: (Dog, Ant)

/* 泛型类型
 泛型类型的访问级别是 类型的访问级别 以及 所有泛型类型参数的访问级别 中最低的那个
 */

class Car {}
fileprivate class Book {}
public class House<T, U> {}

// House<Car, Book>的访问级别是fileprivate
fileprivate var h = House<Car, Book>()

/*
 ##### 成员、嵌套类型
 - 类型的访问级别会影响成员(属性、方法、初始化器、下标)、嵌套类型的默认访问级别
 - 一般情况下，类型为private或fileprivate，那么成员/嵌套类型默认也是private或fileprivate
 - 一般情况下，类型为internal或public，那么成员/嵌套类型默认是internal
 - 直接在全局作用域下定义的private等价于fileprivate
 */
public class PublicClass {
    public var p1 = 0 // public
    var p2 = 0 // internal
    fileprivate func f1() {} // fileprivate
    private func f2() {} // private
}

fileprivate class FPClass {
    func f1() { } // fileprivate
    private func f2 () {} // private
}

private class PClass { // PClass 其实是fileprivate，因为当前是文件全局作用域
    func f1() { print("PClass f1") } // fileprivate
    private func f2 () {} // private

}

private var c = PClass()
c.f1()
//c.f2() // 编译错误
