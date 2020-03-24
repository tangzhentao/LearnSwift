//
//  main.swift
//  08-10汇编中的+15啥意思
//
//  Created by void on 2020/3/17.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 debug时，进入汇编模式，演示 汇编指令前 +10的含义
 */

func test1 () {
    let i = 1
    let j = 2
    let k = 3
    var result = i + j
    result /= k
}

func test2 () {
    let i = 1
    let j = 2
    let k = 3
    var result = i + j
    result /= k
}

test1()
test2()
