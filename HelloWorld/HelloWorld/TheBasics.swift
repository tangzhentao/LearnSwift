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
    
}

