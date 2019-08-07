//
//  Functions.swift
//  HelloWorld
//
//  Created by tang on 2019/8/7.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Functions {
    
    
    /* 测试函数重定义 -- 开始 */
    func greet(person: String) -> Void {
        print("hello, \(person)")
    }
    
    func greet() -> Void {
        print("Hello !")
    }
    
    // 参数为Void类型的变量或常量，并不是不需要传递参数
    func greet(_: Void) -> Void {
        print("Hello, Void!")
    }
    
    func greet() -> String {
        return "Hello !"
    }
    
    func greet(person: String) -> String {
        return "Hello, " + person
    }
    /* 测试函数重定义 -- 结束 */
    
    func printAndCout(string: String) -> Int {
        print(string)
        return string.count
    }
    
    func printWithoutCounting(string: String) -> Void {
        let _ = self.printAndCout(string: string)
        print("")
    }
    
    // 学习有多个返回值的函数
    func learnFunctionWithMultiReturnValues () {
        let numbers = [10, 8, 7, 9, 1, 3, 4, 2]
        var minmax = self.minMax(array: numbers)
        
        if minmax != nil {
            print("min = \(minmax!.min), max = \(minmax!.max)")
        }
        
        
        let nums = [100, 18, 71, 90, 11, 30, 24, 26]
        minmax = self.minMax(array: nums)
        if minmax != nil {
            print("min = \(minmax!.0), max = \(minmax!.1)")
        }

    }
    
    func minMax(array: [Int]) -> (min: Int, max:Int)? {
        
        if array.isEmpty {
            return nil
        }
        
        var min = array[0]
        var max = array[0]
        
        for item in array {
            if item < min {
                min = item
            } else if item > max {
                max = item
            }
        }
        return (min, max)
    }
    
    // 隐式返回的函数(Swift5.1支持，需要xcode10.3来支持)
//    func anotherGreeting(for person: String) ->String {
//        "hello, " + person
//    }
    
    // 指定参数标签
    func greet(person: String, from hometown: String) {
        print("hello, \(person)! Glad you visit from \(hometown)")
    }
    
    func greet(_ person: String, from hometown: String) {
        print("hello, \(person)! Glad you visit from \(hometown)")
    }
    
    func greet1(_ person: String) {
        print("hello, \(person)!")
    }
    
    // 默认参数
    func defaultParamenter1 (first: Int, second: Int = 2) {
        print("first = \(first), second = \(second)")
    }
    func defaultParamenter2 (first: Int = 1, second: Int = 2) {
        print("first = \(first), second = \(second)")
    }
    func defaultParamenter3 (_ first: Int = 1, _ second: Int = 2) {
        print("first = \(first), second = \(second)")
    }
    
    // 可别参数
    func average(numbers: Double...) {
        var sum = 0.0
        let count = numbers.count
        guard count > 0 else {
            print("no number, no average")
            return
        }
        
        for item in numbers {
            sum += item
        }
        
        var average = sum / Double(count)
        print("\(numbers) average is \(average)")
    }

    func learn() {
        
        // 调用func greet(_: Void) -> Void
        self.greet( () )
        self.greet( Void() )
        
        // 调用func greet() -> Void
        let _: Void = self.greet()
        
        // 调用func greet() -> String
        let _: String = self.greet()

        
//        print(self.greet())
        
        let value = self.printWithoutCounting(string: "a string")
        print(value)
        
        self.learnFunctionWithMultiReturnValues()
        
        self.greet(person: "jobs", from: "shanghai");
        
        self.greet("jack", from: "shandong")
        
        self.greet1("zhang san")
        
        self.defaultParamenter1(first: 3, second: 4)
        self.defaultParamenter1(first: 5)
        
        self.defaultParamenter2()
        self.defaultParamenter2(first: 3, second: 4)
        self.defaultParamenter2(second: 6)
        
        self.defaultParamenter3(3, 4)
        self.defaultParamenter3(6)
        
        self.average(numbers: 1, 2, 3, 4)
        self.average()

    }
}
