//
//  Deinitialization.swift
//  HelloWorld
//
//  Created by itang on 2019/8/24.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Deinitialization {
    
    class Bank {
        static var coinsInBank = 10_000
        static func distribute(coins numberOfCoinsRequested: Int) -> Int {
            let numberOfCoinsToVend = min(numberOfCoinsRequested, coinsInBank)
            coinsInBank -= numberOfCoinsToVend
            return numberOfCoinsToVend
        }
        
        static func receive(coins: Int) {
            coinsInBank += coins
        }
    }
    
    class Player {
        var coinsInPurse = 0
        init(coins: Int) {
            coinsInPurse = Bank.distribute(coins: coins)
        }
        
        func win(coins: Int) {
            coinsInPurse += Bank.distribute(coins: coins)
        }
        
        deinit {
            print("left the game")
            Bank.receive(coins: coinsInPurse)
        }
    }
    
    func learn() {
        var player: Player? = Player(coins: 100)
        print("A new player has joined the game with \(player!.coinsInPurse) coins.")
        print("There are now \(Bank.coinsInBank) coins left in bank.")
        
        player!.win(coins: 2000)
        print("player won 2000 coins & now has \(player!.coinsInPurse) coins.")
        print("The bank now only has \(Bank.coinsInBank) coins left.")

        player = nil
        print("player has left the game.")
        print("The bank now has \(Bank.coinsInBank) coins.")
        
    }
}
