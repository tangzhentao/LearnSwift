//
//  main.swift
//  07 extension
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 扩展
 - 在同一个文件的扩展中，可以写成类似多个部分的类型声明
 - 在原本的声明中声明一个私有成员，可以在同一文件的扩展中访问它
 - 在扩展中声明一个私有成员，可以在同一文件的其他扩展中、原本声明中访问它
 */

class Person {
    private func run1 () {
        run2()
    }
    private func eat1 () {}
}

extension Person {
    private func run2 () {}
    private func eat2 () {
        eat1()
    }
}

extension Person {
    private func run3 () {}
    private func eat3 () {
        eat2()
    }
}

