//
//  main.swift
//  05 assert
//
//  Created by void on 2020/5/14.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

func divide(x: Int, y: Int) -> Int {
    assert(y != 0, "除数不能为0")
    return x/y
}

divide(x: 4, y: 0)
