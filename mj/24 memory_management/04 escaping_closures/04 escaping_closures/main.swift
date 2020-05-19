//
//  main.swift
//  04 escaping_closures
//
//  Created by void on 2020/5/19.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation
import Dispatch

/*
 ##### 逃逸闭包
 - 非逃逸闭包、逃逸闭包，一般都是当做参数传递给函数
 - 非逃逸闭包：闭包调用发生在函数结束前，闭包调用在函数作用域内
 - 逃逸闭包：闭包有可能在函数结束后调用，闭包调用逃离了函数的作用域，需要通过@escaping声明
 */

typealias Fn = () -> Void

func test1(_ fn: Fn) {
    fn()
}

var globalFn: Fn?
func test2(_ fn: @escaping Fn) {
    globalFn = fn
}
globalFn?()

func test3(_ fn: @escaping Fn) { //
    DispatchQueue.global().async {
        fn()
    }
}

/*
 ##### 逃逸闭包注意点
 - 逃逸闭包不可以捕获inout参数
 因为闭包执行的时候，inout参数可能已经被释放了
 */
func other1(_ fn: Fn) {
    fn()
}
func other2(_ fn: @escaping Fn) {
    fn()
}
func test (i: inout Int) {
    other1 {
        i += 1
    }
    
    // 报错：逃逸闭包捕获 inout参数
//    other2 {
//        i += 1
//    }
}
