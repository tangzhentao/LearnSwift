//
//  main.swift
//  01 literal
//
//  Created by void on 2020/5/21.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

var age = 10 // Int
var isRed = true // Bool
var name = "jim" // String
var grad = "a" // String
var pi = 3.14 // Double



//IntegerLiteralType
//BooleanLiteralType
//FloatLiteralType
//StringLiteralType

/*
 public typealias IntegerLiteralType = Int
 public typealias FloatLiteralType = Double
 public typealias BooleanLiteralType = Bool
 public typealias StringLiteralType = String
 */

/*
 可以通过typealias修改字面量的默认类型
 且在整个作用域内都起作用
 */
typealias IntegerLiteralType = Double // 对上面定义的变量也起作用
var num = 3 // Double
print(age) // Double
print(num)
print(other_n) // Double
/*
 Swift自带的绝大部分类型，都支持支持通过字面量进行初始化
 - Bool、Int、Float、Double、String、Array、Dictionary、Set、Optional
 */


