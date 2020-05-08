//
//  main.swift
//  02 override
//
//  Created by void on 2020/5/7.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 覆盖父类的：
 计算属性
 下标
 方法
 */
class Animal {
    func speak() -> Void {
        print("animal speak")
    }
    
    subscript (index: Int) -> Int {
        return index
    }
}

class Dog: Animal {
    override func speak() {
        super.speak()
        print("wang wang wang")
    }
    
    override subscript(index: Int) -> Int {
        return super[index] + 1
    }
}


var a = Animal()
a.speak()
a = Dog()
a.speak()

print(a[1])
