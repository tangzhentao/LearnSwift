//
//  main.swift
//  10-02 Closures
//
//  Created by void on 2020/4/26.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("02")

func getFn() -> (Int) -> Int {
    var num = 6

    func add(a: Int) -> Int {
        num += a
        return num
    }

    return add
}

let addFn = getFn()
addFn(1)
//print(addFn(8))
//print("addFn size:", MemoryLayout.stride(ofValue: addFn))

//func plus(a: Int) -> Int {
//    return a + 1
//}
//
//// 函数变量占16个字节
//let plusFn = plus
//print("plusFn size:", MemoryLayout.stride(ofValue: plusFn)) // 16
//plusFn(1)
//let reuslt = 1



