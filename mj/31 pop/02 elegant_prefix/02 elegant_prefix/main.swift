//
//  main.swift
//  02 elegant_prefix
//
//  Created by void on 2020/5/31.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 号称 优雅的前缀
 我看看能不能实现
 
 发现李明杰实现的“优雅的前缀”，会制造一个变量的副本，而且无法修改原变量的值
 所以认为这种方法看似优雅，在内部实现上一点都不优雅。
 
 本打算 使用指向变量的指针而不是副本来实现，但是发现，如果变量是let的，无法使用指针，所以没能实现。
 如果哪天找到了获取指向let变量的指针的方法，那么 真正优雅的前缀 将横空出世。
 
 */

// 计算一个字符串中，有多少数字

var str = "asdfsaf123asfsa456asfda"

/* 实现一 */
var count = 0
let c0: Character = "0"
let c9: Character = "9"
for c in str {
    if c >= c0 && c <= c9 {
        count += 1
    }
}
print(count)

/* 实现二 */
count = 0
for c in str where c >= c0 && c <= c9 {
    count += 1
}
print(count)

/* 实现三 */
extension String {
    var numInteger: UInt {
        var count: UInt = 0
        for c in self where c >= c0 && c <= c9 {
            count += 1
        }
        return count
    }
    
    func myMethod() {
        
    }
}
print(str.numInteger)

let m = str.myMethod

print(m)
/* 实现四
 str.jk.numInteger
 */

extension String {
    var jk: JK<Self> {

        mutating get {
            let pointer = withUnsafeMutablePointer(to: &self, {$0})
            return JK(item: pointer)
        }
        set {}
    }
    
}

struct JK<T> {
    var item: UnsafeMutablePointer<T>
    init(item: UnsafeMutablePointer<T>) {
        self.item = item
    }
}

extension JK where T == String {
    mutating func appendHello() {
        self.item.pointee.append("hello")
    }
}

str.jk.appendHello()
print(str)

func show<T>(_ pointer: UnsafePointer<T>) {
    print(pointer)
}

struct Cat {
    var age = 2
    var id = 15
    
    func show() {
        print(age, id)
    }
}

do {
    var tom = Cat()
    var p = withUnsafePointer(to: &tom) { $0 } // p指向tom变量
    p = withUnsafePointer(to: tom) { $0 } // p 指向的不是tom变量
    show(p)
}


let i = 1
