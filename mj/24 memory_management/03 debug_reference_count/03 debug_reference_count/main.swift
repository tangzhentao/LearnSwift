//
//  main.swift
//  03 debug_reference_count
//
//  Created by void on 2020/5/19.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 没有debug出来结果
 以后有空再debug
 
 不过返现实例中的第二个8字节中存储的2在实例被release以后仍然是2
 */

class Cat {
    var age: Int
    init(age: Int) {
        self.age = age
    }
    
    deinit {
        print("deinit")
    }
}

autoreleasepool {
    let c = Cat(age: 6)
    let d = c
    let i = d.age
    let j = i
}
    

let i = 1
