//
//  main.swift
//  05 enum
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 枚举类型的case
 - 不能给enum的每个case单独设置访问级别
 - 每个case自动接收enum的访问级别
 public enum定义的case也是public
 */

enum Gender {
//   fileprivate case male // 报错
    case male
    case female
}

/*
 ##### 协议
 - 协议中定义的属性、方法自动接收协议的访问级别，不能单独设置访问级别
 public协议定义的要求也是public
 */

internal protocol Living {
//    internal func breathe() // 报错
    func breathe()
}
