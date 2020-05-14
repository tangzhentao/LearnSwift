//
//  main.swift
//  03 rethrows
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

typealias DivideFunc = (Int, Int) throws -> Int

func exec(divideFn: DivideFunc, x: Int, y: Int) rethrows -> Int {
    
//    var z: Int = 0
//    do {
//        z = try divideFn(x, y)
//    }
//    catch {
//        print(error)
//    }
//
//    return z

    return try divideFn(x, y)
}

var z = try? exec(divideFn: divide, x: 4, y: 2)
if let s = z {
    print(s)
}
z = try? exec(divideFn: divide, x: 4, y: 0)
if let s = z {
    print(s)
}

