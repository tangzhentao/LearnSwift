//
//  main.swift
//  01 mark
//
//  Created by void on 2020/5/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 各种注释
 */

// MARK: - 头上有根线
class Cat {
    // MARK: 属性
    var age = 0
    var name = ""
    
    // MARK: 方法
    func run() {
        // TODO: 下次再实现
    }
    
    func catchMouses() -> Any {
        // FIXME: 有待解决
        fatalError() // 函数体还不打算实现，又想编译不报错，用这个致命错误
    }
    func play() {
        #warning("警告：想好了，快来实现")
    }
}
// MARK: - 对的，确实头上有根线

