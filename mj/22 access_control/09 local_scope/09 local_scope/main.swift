//
//  main.swift
//  09 local_scope
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 局部作用域
 可以使用 do 实现局部作用域，类型与C、OC的{}
 */

do {
    var i = 1
    print(i)
    i = 3
}

do {
    var i = 2
    print(i)
    i = 4
}
