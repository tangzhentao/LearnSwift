//
//  main.swift
//  06 存储类型属性本质
//
//  Created by void on 2020/5/5.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

//print("存储类型属性本质!")

/* 三个全局变量地址挨着 */
//var n1 = 1
//var n2 = 2
//var n3 = 3




/* i, count, k地址也挨着 */
var i = 1
class Test {
    static var count = 2 // 懒加载，初始化时，保证初始化一次，使用swift_once(dispatch_once)
}
var k = 3

Test.count = 4


