//
//  main.swift
//  08 ClosuresInout
//
//  Created by void on 2020/4/29.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

func getAddFn() -> (inout Int) -> Void {
    func add (x: inout Int) -> Void {
        x += 1
    }
    
    return add
}

let addFn = getAddFn()
var i = 2
addFn(&i)
print(i)
