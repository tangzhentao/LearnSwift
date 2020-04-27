//
//  main.swift
//  10-1 闭包
//
//  Created by void on 2020/4/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("Hello, World!")

var add = {
    (a: Int, b: Int) -> Int in
    print("hello")
    return a + b
}
let _ = add(1, 2)

