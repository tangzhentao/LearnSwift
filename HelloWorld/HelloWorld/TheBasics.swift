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
        
        self.learnOptional()
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
    
    // 可选类型
    func learnOptional() {
        
        /* 以字符串为参数的Int初始化方法，返回一个可选的Int */
        let possibleNumber1 = "123"
        let possibleNumber2 = "abc"

        var convertedNumber = Int(possibleNumber1)
        print("possible number: \(possibleNumber1), converted number:\(convertedNumber!)") // 强解析。如果值为nil时将crash
        convertedNumber = Int(possibleNumber2)
        print("possible number: \(possibleNumber1), converted number:\(convertedNumber ?? 0)")
        
        /* 可选值可以被赋值为nil */
        var serverResponseCode: Int? = 404
        serverResponseCode = nil
        print("serverResponseCode: \(String(describing: serverResponseCode))")
        
        /* 可选值必须在解包之后才能使用 */
        let num1 = Int(possibleNumber1)
        let sum1 = 2 + num1! // 强制解包可选值 num
        print("sum1 = \(sum1)")
        
        let num2 = Int(possibleNumber2)
        /* 强制解包值为nil的可选值会crash
         let sum2 = 2 + num2!
         */
        let sum2 = 2 + (num2 ?? 0)
        print("sum2 = \(sum2)")
        
        if num2 != nil {
            // 如果走到该分支，说明num2不为nil
            // 所有可以使用强解包
            print("num2 = \(num2!)")
        } else {
            print("num2为nil")
        }
        
        // 可续绑定
        var someInt: Int? // 为初始化的可选值默认为nil
        if let anInt = someInt {
            // 走到这个分支，可以确定someInt有值，所以可以使用强解包
            print("anInt = \(anInt)")
        } else {
            print("someInt为nil")
        }
        
        someInt = 10
        if let anInt = someInt {
            // 走到这个分支，可以确定someInt有值，所以可以使用强解包
            print("anInt = \(anInt)")
        } else {
            print("someInt为nil")
        }
    }
    
}

