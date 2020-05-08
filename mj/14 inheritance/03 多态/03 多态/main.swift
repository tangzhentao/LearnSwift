//
//  main.swift
//  03 多态
//
//  Created by void on 2020/5/7.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 调用结构体的方法，直接call 固定地址
 */
class Animal {
    var age = 2
    func speak() -> Void {
        print("animal speak")
    }
}

let a = Animal()
a.speak()
