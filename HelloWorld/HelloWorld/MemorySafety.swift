//
//  MemorySafety.swift
//  HelloWorld
//
//  Created by tang on 2019/9/26.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

var stepSize = 1

func oneMore(than number: inout Int) {
    number += stepSize // 运行时错误：读写访问冲突
}

class MemorySafety {
    
    func printInoutParameters(x: inout Int, y: inout Int) {
        print("x:", x, "y:",y)
    }
    
    func learn()  {
//        oneMore(than: &stepSize)
        

//        var one = 1
//        printInoutParameters(x: &one, y: &one) // 编译时错误：内存访问冲突
        
    }
}
