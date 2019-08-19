//
//  Methods.swift
//  HelloWorld
//
//  Created by itang on 2019/8/17.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation


// 类方法

//



class Methods {
    
    class Counter {
        var count = 0
        func increment () {
            count += 1
        }
        func increment(by amout: Int) {
            count += amout
        }
        func reset () {
            count = 0
        }
    }
    
    struct Countor {
        var count = 0
        
        /*
         结构体要在方法中要改变属性的值，要在方法前加个关键字mutating；
         因为方法和函数一样，参数对于方法来说是只读的。在方法中访问属性其实是通过self访问的，self其实又是方法中的一个参数；
         */
        mutating func increment () {
            count += 1
        }
        mutating func increment(by amout: Int) {
            count += amout
        }
        mutating func reset () {
            count = 0
        }
    }
    
    struct LevelTracker {
        static var highestUnlockLevel = 1
        static func unlock(_ level: Int) {
            if level > highestUnlockLevel {
                highestUnlockLevel = level
            }
        }
        
        static func isUnlock(_ level: Int) -> Bool {
            return level <= highestUnlockLevel
        }
        
        var currentLevel = 1
        
        @discardableResult
        mutating func advance(to level: Int) -> Bool {
            if LevelTracker.isUnlock(level) {
                currentLevel = level
                return true
            } else {
                return false
            }
        }
    }
    
    // ssh-keygen -t rsa -b 4096 -C "1474968298@qq.com"
    // https://ino298:qq403291569@github.com/ino298/im.git
    
    
    class Player {
        var levelTracker = LevelTracker()
        let name: String
        
        
        func complete(level: Int) {
            LevelTracker.unlock(level + 1)
            levelTracker.advance(to: level + 1)
        }
        
        init(name: String) {
            self.name = name
        }
    }

    
    func learn () {

        let player = Player(name: "jobs")
        player.complete(level: 1)
        print("player's current level", player.levelTracker.currentLevel)
        print("highest level", LevelTracker.highestUnlockLevel)
        player.complete(level: 2)
        let player2 = Player(name: "tom")
        player2.levelTracker.advance(to: 3)
        print("player2 current level", player.levelTracker.currentLevel)

    }
}
