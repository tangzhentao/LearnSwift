//
//  MemorySafety.swift
//  HelloWorld
//
//  Created by tang on 2019/9/26.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

// in-out参数的访问冲突
var stepSize = 1
func oneMore(than number: inout Int) {
    number += stepSize // 运行时错误：读写访问冲突
}



// 方法里self的访问冲突
struct Player {
    var name: String
    var health: Int
    var enegy: Int {
        get {
            return health
        }
        set {
            health = newValue
        }
    }
    static let maxHealth = 10
    
    mutating func restore(){
        health = Player.maxHealth
    }
    
    mutating func shareHealthWith(player: inout Player) {
        let finalHealth = (health + player.health) / 2
        health = finalHealth
        player.health = finalHealth
    }
}

// 属性访问冲突
func balance(x: inout Int, y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

var healths = (health : 10, energy : 1)

class MemorySafety {
    
    func printInoutParameters(x: inout Int, y: inout Int) {
        print("x:", x, "y:",y)
    }
    
    func learnConflictingAccessToSelf() {
        var player1 = Player(name: "da bing", health: 8)
        var player2 = Player(name: "da bing", health: 2)
        
        print("player1 health:", player1.health)
        print("player2 health:", player2.health)
        
        player1.shareHealthWith(player: &player2)
        
        print("player1 health:", player1.health)
        print("player2 health:", player2.health)
        
//        player1.shareHealthWith(player: &player1) // 编译时错误：方法shareHealthWith和其参数player 访问冲突了
    }
    
    func learnConflictingAccessToProperties() {
        var player1 = Player(name: "da bing", health: 8)
//        balance(x: &player1.health, y: &player1.enegy) // 编译时错误，访问冲突
        
//        balance(x: &healths.health, y: &healths.energy)
//        print("healths:", healths)
        
    }
    
    func learn()  {
//        oneMore(than: &stepSize)
        

//        var one = 1
//        printInoutParameters(x: &one, y: &one) // 编译时错误：内存访问冲突
        
        learnConflictingAccessToSelf()
        
        learnConflictingAccessToProperties()
    }
}
