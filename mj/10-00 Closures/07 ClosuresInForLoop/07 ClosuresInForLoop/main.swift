//
//  main.swift
//  07 ClosuresInForLoop
//
//  Created by void on 2020/4/29.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 for循环中的闭包
 */

var fnArray: [() -> Int] = []
for i in 0...3 {
    fnArray.append { i }
}

for item in fnArray {
    print(item())
}

// 0
// 1
// 2
// 3
