//
//  main.swift
//  06 可选项的本质、
//
//  Created by void on 2020/5/15.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation


var x: Int? = 10
x = 20
x = nil

var y = Optional<Int>.some(10)
y = Optional<Int>.none
y = Optional.init(20)
y = .some(30)
y = .none

var z: Optional<Int> = .init(20)
z = .some(30)
z = .none
z = 40
z = nil

z = 50

// 解包方式一
switch z {
case .some(let i):
    print(i)
case .none:
    print("nil")
}

// 解包方式二
switch z {
case let i?: // 这样也会解包
    print(i)
case .none:
    print("nil")
}

// 解包方式三
if let i = z {
    print(i)
} else {
    print("nil")
}

// 多重可选项
var a: Int?? = 10
print(a as Any) // as Any 消除警告
a = Optional<Optional<Int>>.some(Optional<Int>.some(20))
print(a as Any)
a = Optional<Optional<Int>>.none
