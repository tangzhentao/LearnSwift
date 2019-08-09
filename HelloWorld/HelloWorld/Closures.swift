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
    
    func learn() {
        self.useBackward()
        
        useClosureExpression()
        
        useClosureExpressionOmittingParameterType ()
        
        useClosureExpressionOmittingParameterAndReturnType ()

        useClosureExpressWithShorthandArgumentNames ()
        
        useTrailingCloure ()
        
        useTrailingClosure2 ()
        
        learnCaptureValues ()
    }
}
