//
//  NestedTypes.swift
//  HelloWorld
//
//  Created by tang on 2019/9/11.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class NestedTypes
{
    
    struct BlackjackCard {
        // 嵌套的枚举：花色
        enum Suit: Character {
            case spades = "♠", hearts = "♡", diamonds = "♢", clubs = "♣"
        }
        
        // 嵌套的枚举：Rank
        enum Rank: Int {
            case two = 2, three, four, five, six, seven, eight, nine, ten
            case jack, queen, king, ace
            
            // 嵌套在枚举类型中的结构体
            struct Values {
                var first: Int, second: Int?
            }
            
            var values: Values {
                switch self {
                case .ace:
                    return Values(first: 1, second: 11)
                case .jack, .queen, .king:
                    return Values(first: 10, second: nil)
                default:
                    return Values(first: self.rawValue, second: nil)
                }
            }
        }
        
        let suit: Suit, rank:Rank
        
        var description: String {
            var output = "suit is \(suit)"
            output += " value is \(rank.values.first)"
            if let second = rank.values.second {
                output += " or \(second)"
            }
            return output
        }
    }
    
    func learn() {
        let aceOfSpades = BlackjackCard(suit: .spades, rank: .ace)
        print("card:", aceOfSpades.description)
        
        // 使用嵌套类型
        let hearts = BlackjackCard.Suit.hearts.rawValue
        print("hearts:", hearts)
    }
    
    
}
