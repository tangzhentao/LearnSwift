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
        
        self.learnErrorHandling()
        
//        self.learnAssertion()
//        self.learnPreconditions()
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
    
    /* 错误处理 -- 开始 */
    func learnErrorHandling () {
        
        for cond in 0 ... 2 {
            do {
                try self.makeSandwich(condition: cond)
            } catch {
                print("error occurred: \(error)")
            }
        }
        
        for cond in 0 ... 2 {
            do {
                try self.makeSandwich(condition: cond)
            } catch MakeSandwichError.NoCleanDishes{
                print("No clean dished, go to wash dishes.")
            } catch MakeSandwichError.NoButter {
                print("No butter, go to buy butter.")
            } catch {
                print(error)
            }
        }
        
    }
    
    enum MakeSandwichError: Error {
        case NoCleanDishes
        case NoButter
    }
    
    func makeSandwich(condition: Int) throws {
        
        defer {
            print("have a break")
        }
        
        if condition == 1 {
            throw MakeSandwichError.NoCleanDishes
        } else if condition == 2 {
            throw MakeSandwichError.NoButter
        } else {
            print("wow, did make a delicious sandwich!")
        }
    }
    /* 错误处理 -- 结束 */
    
    // 断言
    func learnAssertion () {
        
        /*
         下面的代码在debug模式下会报错，但release模式下不会报错
         */
        let age = -3
        
        assert(age > 0) // Assertion failed: ...
        assert(age > 0, "age can not be negative.") // Assertion failed: ...
        
        if age <= 0 {
            assertionFailure("you know, age can not be negative.") // Fatal error: ...
        }
    }
    
    func learnPreconditions() -> Void {
        /*
         下面的代码在debug和release模式下都会停止运行，
         但debug下会有详细的错误信息，而release模式下没有
         */
        let index = 1
        precondition(index > 0) // Preconditon failed: ...
        precondition(index > 0, "index must be greater than 0.") // Preconditon failed: ...
        
        if index <= 0 {
            preconditionFailure("you konw, index must be greater than 0") // Fatal error: ...
        }
        
        /*
         下面的代码在debug和release模式下表现一直：都会打印详细的错误信息
         */
        fatalError() // Fatal error: ...
        fatalError("terrible") // Fatal error: ...
        
    }
    
    
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

