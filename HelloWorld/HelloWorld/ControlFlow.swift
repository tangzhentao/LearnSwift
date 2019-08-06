//
//  ControlFlow.swift
//  HelloWorld
//
//  Created by tang on 2019/8/6.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class ControlFlow {
    
    func learnForInLoops() {
        
        // 使用for-in 遍历数组
        let names = ["tom", "lily", "jim", "may", "mary"]
        for name in names {
            print("\(name) ", terminator: "")
        }
        print("")
        
        // 使用for-in 遍历字典
        let numOflegs = ["spider":8, "ant": 6, "cat" : 4]
        for (name, numLegs) in numOflegs {
            print("\(name) has \(numLegs) legs")
        }
        print("")
        
        // for-in 使用区间
        for index in 1...5 {
            print("\(index) times 5 is \(index * 5)")
        }
        print("")
        
        // 不需要使用索引的话，可以用 _ 忽略
        for _ in 1...5 {
            print("hello")
        }
        
        let base = 2
        let power = 6
        var answer = 1
        for _ in 1...power {
            answer *= base
        }
        // 2的6次幂是64
        print("\(base) to the power of \(power) is \(answer)")
        
        // 指定步幅 - 用to来指示 是 开区间
        let minutes = 60
        for time in stride(from: 0, to: minutes, by: 10) {
            print("\(time) ", terminator: "")
        }
        print("")
        
        // 指定步幅 - 用though来指示 是 闭区间
        for time in stride(from: 0, through: minutes, by: 10) {
            print("\(time) ", terminator: "")
        }
        print("")
        
        self.snakesAndLaddersGame()
        self.snakesAndLaddersGame2()

    }
    
    // 蛇和梯子的游戏
    func snakesAndLaddersGame () {
        
        var square = 0
        var diceroll = 0
        let finalSquare = 25
        var board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        
        while square < finalSquare {
            diceroll += 1
            if diceroll > 6 {
                diceroll = 1
            }
            
            let original = square
            square += diceroll
            let midle = square
            var additon = 0
            if square < finalSquare {
                additon = board[square]
                square += board[square]
            }
            
            print("roll dice: \(diceroll), from \(original) to \(midle), addtion: \(additon), final: \(square)")
        }
        print("game over")
        
    }
    
    func snakesAndLaddersGame2 () {
        
        var square = 0
        var diceroll = 0
        let finalSquare = 25
        var board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        
        
        repeat {
            let original = square
            let additon = board[square]
            square += board[square]
            let midle = square

            diceroll += 1
            if diceroll > 6 {
                diceroll = 1
            }
            
            square += diceroll
            
            print("roll dice: \(diceroll), from \(original) to \(midle), addtion: \(additon), final: \(square)")
        } while (square < finalSquare)
        print("game over")
        
    }
    
    func learnSwitch() {
        
        // 一次读取一个输入，直到输入的整数是100
        var num = 0
        repeat {
            num = 0
            print("input a integer: ")
            if let inputStr = readLine() {
                if let i = Int(inputStr) {
                    num = i
                }
            }
            print("input integer is \(num)")
            print("")
            
            
            // 使用switch来判断成绩的好坏
            switch num {
            case 0:
                print("what's wrong!")
            case 1..<20:
                print("terrible")
            case 20..<40:
                print("bad")
            case 40..<60:
                print("failed")
            case 60..<80:
                print("pass")
            default:
                print("good")
            }
            
        } while num != 100
        
    }
    
    // 匹配元祖
    func learnSwithWithTuple () {
        
        let points = [(0, 0), (1, 0), (0, 1), (1, 2), (3, 3)]
        for point in points {
            switch point {
            case (0, 0):
                print("\(point) is at the origin")
            case (_, 0):
                print("\(point) is at the x-axis")
            case (0, _):
                print("\(point) is at the y-axis")
            case (-2...2, -2...2):
                print("\(point) is inside the box")
            default:
                print("\(point) is outside the box")
            }
        }
    }
    
    // 在switch case中使用绑定值
    func learnSwithWithBingValue () {
        let points = [(0, 0), (1, 0), (0, 1), (1, 2), (3, 3)]
        for point in points {
            switch point {
            case (0, 0):
                print("\(point) is at the origin")
            case (let x, 0):
                print("\(point) is at the x-axis, x = \(x)")
            case (0, let y):
                print("\(point) is at the y-axis, y = \(y)")
            case (let x, let y):
                print("\(point) is inside the box, x = \(x), y = \(y)")
            }
            
            // 情况已经是完备的，不需要default情况。加上default反而会报警告
        }
    }
    
    // 在switch case中使用where
    func learnSwithWithWhere () {
        let points = [(0, 0), (1, 1), (2, -2), (1, 2), (3, 3)]
        for point in points {
            switch point {
            case let (x, y) where x == y:
                print("\(x), \(y) is on the line x == y")
            case let (x, y) where x == -y:
                print("\(x), \(y) is on the line x == -y")
            case let (x, y):
                print("\(x), \(y) is is just some arbitrary point")
            }
            
            // 情况已经是完备的，不需要default情况。加上default反而会报警告
        }
    }
    
    // 复合情况
    func learnSwithWithCompound () {
        let letters = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2"]
        
        for letter in letters {
            
            switch letter {
            case "a", "e", "i", "o", "u":
                print("\(letter) is a vowel")
                
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
                 "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                    print("\(letter) is a consonant")
            default:
                print("\(letter) is not a vowel or a consonant")
            }
        }
    }
    
    func learnSwithWithCompoundAndBindValues () {
        let points = [(0, 9), (7, 0), (2,4), (6,6)]
        for point in points {
            
            switch point {
            case (let distance, 0), (0, let distance):
                print ("\(point) On an anxis, \(distance) from origin")
            default:
                print("\(point) Not no axis")
            }
        }
    }
    
    func learnfallthrough () {
        let integerToDescribe = 5
        var description = "The number \(integerToDescribe) is "
        switch integerToDescribe {
        case 2, 3, 5, 7, 11:
            description += " a prime number, and also "
            fallthrough
        default:
            description += "an integer."
        }
        
        print(description)
    }
    
    /*
     蛇和梯子的游戏
     修改一下赢的规则：
     刚好落在25上才算赢，如果超过了25就重新掷骰子，直到落到25为止
     */
    func snakesAndLaddersGame3 () {
        
        var square = 0
        var diceroll = 0
        let finalSquare = 25
        var board = Array(repeating: 0, count: finalSquare + 1)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
        
        gameLoop: while square != finalSquare {
            diceroll += 1
            if diceroll > 6 {
                diceroll = 1
            }
            
            let original = square
            let midle = square + diceroll
            var additon = 0

            switch midle {
            case finalSquare:
                // 骰子数刚好使玩家移动到最终的方格里，游戏结束。
                print("roll dice: \(diceroll), from \(original) to \(midle), addtion: \(additon), final: \(midle)")
                break gameLoop
            case let value where value > finalSquare:
                // 骰子数将会使玩家的移动超出最后的方格，那么这种移动是不合法的，玩家需要重新掷骰子
                print("roll dice: \(diceroll), from \(original) to \(midle), addtion: \(additon), final: \(midle)")
                continue gameLoop
            default:
                // 合法移动，做正常的处理
                square = midle
                additon = board[square]
                square += board[square]
            }
            
            print("roll dice: \(diceroll), from \(original) to \(midle), addtion: \(additon), final: \(square)")
        }
        print("game over")
        
    }
    
    func learnGuard () {
        self.greet(person: ["name" : "Jobs"])
        self.greet(person: ["name" : "Tom", "location" : "New York"])

    }
    
    func greet(person: [String:String]) {
        guard let name = person["name"] else {
            return
        }
        
        print("hello, \(name)!")
        
        guard let location = person["location"] else {
            print("I hope the wether is nice near you.")
            return
        }
        
        print("I hope the wether is nice in \(location).")
    }
    
    func learn() {
        self.learnForInLoops()
        
//        self.learnSwitch()
        
        self.learnSwithWithTuple()
        
        self.learnSwithWithBingValue()
        
        self.learnSwithWithWhere()

        self.learnSwithWithCompound()
        
        self.learnSwithWithCompoundAndBindValues()

        self.learnfallthrough()
        
        self.snakesAndLaddersGame3()
        
        self.learnGuard()
    }
}
