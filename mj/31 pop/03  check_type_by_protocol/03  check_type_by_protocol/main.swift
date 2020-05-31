//
//  main.swift
//  03  check_type_by_protocol
//
//  Created by void on 2020/5/31.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 使用协议判断类型
 - 判读变量是不是数组变量
 - 判断一种类型是不是数组类型
 */

func isArray(_ value: Any) -> Bool {
    value is [Any]
}

let array1 = [1, 2, 3]
let array2 = ["1", "2"]
let array3: [Any] = [1, "2"]

print(isArray(array1)) // true
print(isArray(array2)) // true
print(isArray(array3)) // true
print(isArray("1")) // false

protocol ArrayProtocol {}
extension Array: ArrayProtocol {}
extension NSArray: ArrayProtocol {}

func isArrayType(_ type: Any.Type) -> Bool {
    type is ArrayProtocol.Type
}
print(isArrayType([Any].self)) // true
print(isArrayType([Int].self)) // true
print(isArrayType(NSArray.self)) // true
print(isArrayType(NSMutableArray.self)) // true
print(isArrayType(Int.self)) // false
