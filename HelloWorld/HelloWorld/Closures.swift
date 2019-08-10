//
//  Closures.swift
//  HelloWorld
//
//  Created by itang on 2019/8/8.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Closures {
    
    // 前后颠倒？
    func backward(s1: String, s2: String) -> Bool {
        return s1 > s2
    }
    
    func useBackward() {
        print("use function to sort")
        let names = ["zhang san", "a da", " li si", "wang wu", "niu er", "qian jin", "song liu", "cao cao"]
        let reversedNames = names.sorted(by: backward(s1:s2:))
        print(reversedNames)
    }
    
    // 使用闭包表达式
    func useClosureExpression () {
        print("use closure to sort")
        let names = ["zhang san", "a da", " li si", "wang wu", "niu er", "qian jin", "song liu", "cao cao"]
        let reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
            return s1 > s2
        })
        print(reversedNames)
    }
    // 使用省略了参数类型的闭包表达式
    func useClosureExpressionOmittingParameterType () {
        print("use closure to sort, which omit parameter type")
        let names = ["zhang san", "a da", " li si", "wang wu", "niu er", "qian jin", "song liu", "cao cao"]
        let reversedNames = names.sorted(by: {(s1, s2) -> Bool in
            return s1 > s2
        })
        print(reversedNames)
    }
    // 使用省略了参数类型和返回值类型的闭包表达式
    func useClosureExpressionOmittingParameterAndReturnType () {
        print("use closure to sort, which omit parameter and return type")
        let names = ["zhang san", "a da", " li si", "wang wu", "niu er", "qian jin", "song liu", "cao cao"]
        let reversedNames = names.sorted(by: {s1, s2 in return s1 > s2 })
        print(reversedNames)
    }
    
    // 使用参数名缩写的闭包表达式
    func useClosureExpressWithShorthandArgumentNames () {
        print("use closure to sort, which use shorthand argument names")
        let names = ["zhang san", "a da", " li si", "wang wu", "niu er", "qian jin", "song liu", "cao cao"]
        let reversedNames = names.sorted(by: { $0 > $1 })
        print(reversedNames)
    }
    
    // 使用运算符方法
    func useOperatorMethod () {
        print("use closure to sort, which use operator method")
        let names = ["zhang san", "a da", " li si", "wang wu", "niu er", "qian jin", "song liu", "cao cao"]
        let reversedNames = names.sorted(by: > )
        print(reversedNames)
    }
    
    // 使用尾随闭包形式
    func useTrailingCloure () {
        print("use closure to sort, which use trailing closure 1")
        let names = ["zhang san", "a da", " li si", "wang wu", "niu er", "qian jin", "song liu", "cao cao"]
        let reversedNames = names.sorted() { $0 > $1}
        print(reversedNames)
        print("use closure to sort, which use trailing closure 2")
        let reversedNames2 = names.sorted { $0 > $1}
        print(reversedNames2)
    }
    
    // 使用尾随闭包形式，例子2
    func useTrailingClosure2 () {
        
        let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
                          5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
        
        let digits = [0, 7, 16, 25, 38, 99, 66, 365]
        let strings = digits.map { (digit) -> String in
            
            var num = digit
            var output  = ""
            
            repeat {
                let mod = num % 10
                let name = digitNames[mod]
                if name != nil {
                    output = name! + output
                }
                
                num /= 10
            } while num > 0
            
            return output
        }
        
        print(digits)
        print(strings)
        
    }
    
    // 值捕获
    func learnCaptureValues () {
        
        let incrementer = makeIncrementer(forIncrement: 2)
        print("incrementer: \(incrementer())")
        print("incrementer: \(incrementer())")
        print("incrementer: \(incrementer())")
        print("incrementer: \(incrementer())")

    }
    
    func makeIncrementer (forIncrement amout: Int) -> ()->Int {
        var runningTotal = 0
        func incrementer() -> Int {
            runningTotal += amout
            return runningTotal
        }

        
        return incrementer
    }
    
    /*
     逃逸闭包
     逃逸闭包就是，闭包作为参数传入到函数内部后，函数把闭包保存起来之后，直接返回，
     在以后的某个时机再把闭包取出来执行
     */
    var completeHandler: [()->Void] = []
    func someFunctionWithEscapingClosure(closure: @escaping ()->Void) {
        completeHandler.append(closure)
    }
    func someFunctionWithNonescapingClosure(closure: ()->Void) {
        closure()
    }
    
    var x = 0
    func doSomething () {
        someFunctionWithNonescapingClosure {
            x = 200
        }
        
        print("x = \(x)")
        
        // 使用逃逸闭包访问实例变量，必须显示引用self
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        completeHandler.first!()
        print("x = \(x)")

    }
    
    /* 自动闭包 */
    
    // 使用显式闭包
    func useExplicitClosure1 () {
        var customersInLine = ["zhang san", "li si", "wang wu", "ma liu"]
        
        print("the number of customer in line: \(customersInLine.count)")
        let customerProvider = { customersInLine.remove(at: 0) }
        print("the number of customer in line: \(customersInLine.count)")

        print("now serving \(customerProvider())")
        print("the number of customer in line: \(customersInLine.count)")

    }
    
    // 定义参数为一个显式闭包
    func serve(customer customerProvider: ()->String) {
        print("now serving: \(customerProvider())")
    }
    // 使用显式闭包
    func useExplicitClosure2 () {
        var customersInLine = ["zhang san", "li si", "wang wu", "ma liu"]
        
        print("the number of customer in line: \(customersInLine.count)")
        serve(customer: {customersInLine.remove(at: 0)}) // 显式闭包{customersInLine.remove(at: 0)}
        print("the number of customer in line: \(customersInLine.count)")
    }
    
    // 定义参数为一个自动闭包
    func server2(customer customerProvider: @autoclosure ()->String) {
        print("now serving: \(customerProvider())")
    }
    // 使用自动闭包
    func useAutoclosure() {
        var customersInLine = ["zhang san", "li si", "wang wu", "ma liu"]
        
        print("the number of customer in line: \(customersInLine.count)")
        server2(customer: customersInLine.remove(at: 0) ) // 自动把表达式customersInLine.remove(at: 0) 包装为显示闭包
        print("the number of customer in line: \(customersInLine.count)")
    }
    
    // 使用逃逸自动闭包
    var customerProviders: [()->String] = []
    func collectCustomerProviders(_ customerProvider: @escaping @autoclosure ()->String ) {
        customerProviders.append(customerProvider)
    }
    func useEscapingAutoclosure () {
        var customersInLine = ["zhang san", "li si", "wang wu", "ma liu"]
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))
        collectCustomerProviders(customersInLine.remove(at: 0))

        
        for item in customerProviders {
            print("now serving \(item())")
        }
    }
    
    
    
    func learn() {
        self.useBackward()
        
        useClosureExpression()
        
        useClosureExpressionOmittingParameterType ()
        
        useClosureExpressionOmittingParameterAndReturnType ()

        useClosureExpressWithShorthandArgumentNames ()
        
        useTrailingCloure ()
        
        useTrailingClosure2 ()
        
        learnCaptureValues ()
        
        doSomething ()
        
        useExplicitClosure1()
        
        useExplicitClosure2()
        
        useAutoclosure ()
        
        useEscapingAutoclosure ()
    }
}
