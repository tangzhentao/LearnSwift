//
//  ErrorHandling.swift
//  HelloWorld
//
//  Created by itang on 2019/9/8.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class ErrorHandling {
    enum VendingMachineError: Error {
        case InvalidSelection
        case InsufficientFunds(coinsNeeded: Int)
        case OutOfStock
    }
    
    struct Item {
        var price: Int
        var cout: Int
    }
    
    class VendingMachine {
        
        var inventory = ["candy bar" : Item(price: 13, cout: 9),
                 "chips": Item(price: 10, cout: 10),
                 "cake": Item(price: 5, cout: 1)]
        
        var coionsDeposited: Int = 0 // 投入的硬币
        
        func vend(itemName name: String) throws {
            guard let item = inventory[name] else {
                throw VendingMachineError.InvalidSelection
            }
            
            guard coionsDeposited >= item.price else {
                throw VendingMachineError.InsufficientFunds(coinsNeeded: (item.price - coionsDeposited))
            }
            
            guard item.cout > 0 else {
                throw VendingMachineError.OutOfStock
            }
            
            coionsDeposited -= item.price
            var newItem = item
            newItem.cout -= 1
            inventory[name] = newItem
            
            print("dispensing \(name)")
        }
    }
    
    // 错误处理方式一: 传递错误
    let favoriteSnacks = ["Alice" : "chips",
                          "Bob" : "licorice",
                          "Eve" : "preteze"]
    func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
        let snack = favoriteSnacks[person] ?? "candy bar"
        try vendingMachine.vend(itemName: snack)
    }
    
    func testBuyFavoriteSnack() {
        do {
            try buyFavoriteSnack(person: "Alice", vendingMachine: VendingMachine())
        } catch  {
            print("buy error:", error)
        }
    }
    
    func testVendingMachine() {
        let vendingMaching = VendingMachine()
        
        // 没有这个商品
        do {
            try vendingMaching.vend(itemName: "chocolate")
        } catch {
            print("error:", error)
        }
        // 投的币不够
        vendingMaching.coionsDeposited = 6
        do {
            try vendingMaching.vend(itemName: "chip")
        } catch VendingMachineError.InsufficientFunds(let coinsNeeded) {
            print("投的币不够，再投再买")
            vendingMaching.coionsDeposited += coinsNeeded
            do {
                try vendingMaching.vend(itemName: "chip") }
            catch {
                print("error:", error)
            }
        } catch {
            print("error:", error)
        }
        
        
        // 商品卖光了
        vendingMaching.coionsDeposited = 10
        do {
            try vendingMaching.vend(itemName: "cake")
            try vendingMaching.vend(itemName: "cake")
        } catch {
            print("error:", error)
        }
        
    }
    
    enum NumberError: Error {
        case negative
    }
    func returnInteger(x: Int) throws -> Int {
        let result = x + 2
        guard result >= 0 else {
            throw NumberError.negative
        }
        
        return result
    }
    
    
    func learn() {
        
        testBuyFavoriteSnack ()
        testVendingMachine()
        
    }
}
