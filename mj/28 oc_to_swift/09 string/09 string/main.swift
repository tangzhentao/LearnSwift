//
//  main.swift
//  09 string
//
//  Created by void on 2020/5/27.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### String
 - Swift的字符串String跟OC的NSString，在API设计上有较大的差异
 */

// 空字符串
var emptyStr1 = ""
var empttyStr2 = String()

// 拼接字符串
var str: String = "1"
str.append("_2")
str = str + "_3"
str += "_4"
str = "\(str)_5"
print(str.count, str)

// 前缀、后缀
print(str.hasPrefix("1_"))
print(str.hasSuffix("_5"))


/* 插入、删除 */
// 插入字符
str.insert("_", at: str.endIndex)
// 插入字符串
str.insert(contentsOf: "6_7", at: str.endIndex) // 1_2_3_4_5_6_7

/*
 ##### string 的index并不是简单的整数
 "0123456"
 - startIndex：第一个字符的位置，即0的位置
 - endIndex：最后一个字符后面那个位置，即6后一位的位置
 - 插入字符(串)到startIndex前或到endIndex后，都会报越界错误
 ```swift
 str.insert(contentsOf: "_666", at: str.index(before: str.startIndex)) // 越界
 str.insert(contentsOf: "_888", at: str.index(after: str.endIndex)) // 越界
 ```
 */
print(str.startIndex, str.endIndex) // Index(_rawBits: 1) Index(_rawBits: 851969) // Index(_rawBits: 1) Index(_rawBits: 851969

str.insert(contentsOf: "_666", at: str.index(after: str.startIndex)) // 1_666_2_3_4_5_6_7
print(str)
str.insert(contentsOf: "888_", at: str.index(before: str.endIndex)) // 1_666_2_3_4_5_6_888_7
print(str)
str.insert(contentsOf: "-000-", at: str.index(str.startIndex, offsetBy: 2)) // 1_-000-666_2_3_4_5_6_888_7
print(str)


/* 删除 */

// 删除第一个字符
var first: Character = str.remove(at: str.startIndex) // _-000-666_2_3_4_5_6_888_7
// 删除最后一个字符
var last: Character = str.remove(at: str.index(before: str.endIndex)) // _-000-666_2_3_4_5_6_888_
print(str)

first = str.removeFirst() // -000-666_2_3_4_5_6_888_
last = str.removeLast() // -000-666_2_3_4_5_6_888
print(str)

// 删除开头/结尾多个字符
str.removeFirst(4) // -000-666_2_3_4_5_6_888
str.removeLast(4) // -000-666_2_3_4_5_6
print(str)

// 删除指定区间的内容: 删除尾部的4个字符
let rang = str.index(str.endIndex, offsetBy: -4)..<str.endIndex
str.removeSubrange(rang) // -666_2_3_4
print(str)

// 删除指定的字符: 删除所有的6
str.removeAll {
    $0 == "6"
} // _2_3_4
print(str) // _2_3_4
str.removeAll() // ""
print(str)
