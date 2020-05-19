//
//  main.swift
//  03 getter_setter
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### getter、setter
 - `getter`、`sette`r默认自动接收它们所属环境的访问级别
 - 可以给`sette`r单独设置一个比`getter`更低的访问级别，用以限制写的权限
 */
var other_can_set = 1
fileprivate(set) internal var other_cannot_set = 2

struct Person {
   private(set) var age = 0
    
    mutating func nextYear() {
        age += 1
    }
    
    fileprivate(set) internal subscript(index: Int) -> Int {
        get {
            return age
        }
        
        set {
            age = newValue
        }
    }
}

var jim = Person()
print(jim.age)
//jim.age = 2 // 报错：不能访问age的私有方法set
jim.nextYear()
print(jim.age)

jim[0] = 10
print(jim[0])

