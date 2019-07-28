//
//  TheBasics.swift
//  HelloWorld
//
//  Created by itang on 2019/7/28.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class TheBasics {
    func test() {
        /*
         print 默认以换行结束
         /* 现在改为结束不换行 */
         */
        print("hello The basics", terminator: "")
        
        self.IntegerConver()
        
        self.learnTuples()
    }
    
    // 整数类型转换
    func IntegerConver() -> Void {
//        var u: UInt = -1
        let i = 1
        let i_8: UInt8 = 2
        
        let sum = i + Int(i_8)
        
        print(sum)
        
        /* 此行将报错
         声明一个非空变量时，必须赋h初始值
         var abc
         */
    }
    
    // 元祖
    func learnTuples () {
        let http404error = (404, "Not Found")
        // 使用下标访问元祖中的值
        print("response code: \(http404error.0), message: \(http404error.1)")
        // 使用常量或变量将元祖分解
        let (statusCode, message) = http404error
        print("statusCode: \(statusCode), message: \(message)")
        // 只分解自己感兴趣的值
        let (code, _) = http404error
        print("code: \(code)")
        
        // 给元祖的值命名
        let http200status = (statusCode: 200, message: "success")
        // 使用值的名字访问
        print("status: \(http200status.statusCode), message: \(http200status.message)")
    }
    
}

