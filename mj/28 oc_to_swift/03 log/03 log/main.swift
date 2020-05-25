//
//  main.swift
//  03 log
//
//  Created by void on 2020/5/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 日志
 debug下打日志
 release下不打日志
 
 print不打印时间
 NSLog打印时间
 */


func jkLog<T>(_ msg: T,
              file: NSString = #file,
              line: Int = #line,
              fn: String = #function) {
    #if DEBUG
    let prefix = "\(file.lastPathComponent):\(line):\(fn):"
    print(prefix, msg)
    #endif
}

print(#function)



class Cat {
    func printHello() {
        jkLog("这是条日志")
    }
}
Cat().printHello()

NSLog("OC log")
NSLog("OC log %@", "yes")

