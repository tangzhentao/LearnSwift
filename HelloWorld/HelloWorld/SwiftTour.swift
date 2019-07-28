//
//  SwiftTour.swift
//  HelloWorld
//
//  Created by itang on 2019/7/28.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class SwiftTour {
    func learn () -> Void {
        let const1 = 10
        let const2 = 10.0
        var var1 = 1
        var var2: Double = 1
        var var3 = "hello"
        
        
        
        
        print("Hello, World!")
        
        print("const1 = , const2 = , var1 = , var2 = , var3 = ", const1, const2, var1, var2, var3)
        
        var2 = 2
        print(var2)
        
        let with = 82
        let label = "good"
        let des = String(with) + label
        print(des)
        
        // 数字转字符串的快捷方式
        let appleNum = 3
        let orangeNum = 5
        let appleSummary = "I have \(appleNum) apples"
        let fruitSummary = "I have \(appleNum) apples and \(orangeNum) oranges"
        print(appleSummary)
        print(fruitSummary)
        
        let score = 88.5
        let name = "LiMei"
        let studentSummary = "Li Mei gets \(score)"
        print(studentSummary)
        
        print("\(name) gets \(score)")
        
        let qutation = """
        I said I have \(appleNum) apples.
        And then I said I have \(appleNum + orangeNum) fruits.
        ha ha ha...
        ha ha ha ~
        """
        
        print(qutation)
        
        // arry, dictionary
        var shoppingList = ["apple", "orange", "bread"]
        print(shoppingList)
        shoppingList[2] = "banana"
        print(shoppingList)
        
        var occuptions = [
            "Li" : "HangZhou",
            "Wang" : "BeiJing",
        ]
        print(occuptions)
        occuptions["Li"] = "ShangHai"
        occuptions["Zhao"] = "NanJing"
        print(occuptions)
        
        shoppingList = []
        occuptions = [:]
        
        print(shoppingList)
        print(occuptions)
        
        occuptions["song"] = "NanHai"
        print(occuptions)
        
        var ipList = [String]()
        var cities = [String:String]()
        cities["浙"] = "浙江"
        cities["皖"] = "安徽"
        print(ipList)
        print(cities)
        
        // 控制流
        
        let individualScores = [75, 43, 100, 88, 20]
        var teamScore = 0;
        
        for score in individualScores {
            if score > 50 {
                teamScore += 3
            } else {
                teamScore += 1
            }
        }
        
        print("team score is \(teamScore)")
        
        // 可选值变量
        var optionalString : String? = "hello"
        print(optionalString == nil)
        optionalString = nil
        print(optionalString == nil)
        
        // 可选值与if的条件表达式
        var optionalName : String? = "John"
        optionalName = nil
        var greeting = "hello"
        if let name = optionalName {
            greeting = "hello, \(name)"
        }
        // ??操作符提供默认值
        var nickName:String? = "asdf"
        nickName = nil
        var fullName = "L.B.J"
        var informalGreeting = "Hello, \(nickName ?? fullName)"
        print(informalGreeting)
        
        // 强大的switch
        var vegetable = "red pepper"
        //vegetable = "watercress"
        switch vegetable {
        case "celegry":
            print("add some raisins and make ants on a log")
        case "cucumber", "watercress":
            print("That would make a good tea sandwish.")
        case let x where x.hasSuffix("pepper"):
            print("Is it a spicy \(x)")
        default:
            print("Everyting tastes good in soup.")
        }
        
        // 使用for - in 遍历字典
        let interstingNumbers = ["prime" : [1, 2, 3, 5, 7],
                                 "fib" : [1, 1, 2, 3, 5],
                                 "square": [1, 4, 9, 16]]
        for (kind, numbers) in interstingNumbers {
            print("\(kind): \(numbers)")
        }
        
        var largest = 0
        for (_, numbers) in interstingNumbers {
            for num in numbers {
                if num > largest {
                    largest = num
                }
            }
        }
        
        print("largest is \(largest)")
        
        largest = 0
        var largestKind = ""
        for (kind, numbers) in interstingNumbers {
            for num in numbers {
                if num > largest {
                    largest = num
                    largestKind = kind
                }
            }
        }
        
        print("largest is \(largestKind) : \(largest)")
        
        // while循环
        
        var n = 1
        while n < 100 {
            n *= 2
        }
        
        print("n = \(n)")
        
        var m = 1
        repeat {
            m *= 2
        } while m < 100
        print("m = \(m)")
        
        for i in 0 ..< 10 {
            print("i = \(i)")
        }
        
        for i in 0 ... 10 {
            print("i = \(i)")
        }
        
        func greet (person : String, day : String) -> String {
            return "Hello, \(person), today is \(day)"
        }
        
        let hi = greet(person : "sam", day : "Saturday")
        print(hi)
        
        // 使用参数标签
        func personInfo (_ person : String, is identity : String) {
            print("\(person) is \(identity)")
        }
        
        personInfo("Li ming", is: "a student")
        personInfo("Wang er", is: "a tearcher")
    }
}
