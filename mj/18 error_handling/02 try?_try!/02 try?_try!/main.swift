//
//  main.swift
//  02 try?_try!
//
//  Created by void on 2020/5/14.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

enum CalculateError: Error {
    case zero(String)
    case overfloat
}

func divide(x: Int, y: Int) throws -> Int {
    if y == 0 {
        throw CalculateError.zero("divide 0")
    }
    return x/y
}

// try? 等价于
var s: Int?
do {
    s = try divide(x: 4, y: 0)
}
catch {
    s = nil
}

var z = try? divide(x: 4, y: 2)
if let r = z {
    print(r) // 2
} else {
    print("遇到错误")
}
z = try? divide(x: 4, y: 0)

if let r = z {
    print(r)
} else {
    print("遇到错误")
}

var r = try! divide(x: 4, y: 2)
print(r) // 2
r = try! divide(x: 4, y: 0) // crash

