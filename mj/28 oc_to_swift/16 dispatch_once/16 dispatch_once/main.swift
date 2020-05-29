//
//  main.swift
//  16 dispatch_once
//
//  Created by void on 2020/5/29.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 代码只执行一次，且线程安全
 从swift3.0开始，dispatch_once被废弃了，推荐使用静态常量
 */
class Once {
    
    // 懒加载类属性的底层使用了dispatch_once
    // 所以保证了下面的闭包表达式只执行一次，且线程安全
    static var once: Void = {
        print("只执行一次")
    }()
}

let one = Once()
let _ = Once.once
let _ = Once.once
let _ = Once.once
