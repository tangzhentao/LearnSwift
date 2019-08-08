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
    
    func learn() {
        self.useBackward()
        
        useClosureExpression()
        
        useClosureExpressionOmittingParameterType ()
        
        useClosureExpressionOmittingParameterAndReturnType ()

        useClosureExpressWithShorthandArgumentNames ()
    }
}
