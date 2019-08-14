//
//  Properties.swift
//  HelloWorld
//
//  Created by itang on 2019/8/14.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

class Properties {
    
    func learnStoredProperties () {
        var rangOfThreeItems = FixedLengthRange(firstValue: 3, length: 3)
        rangOfThreeItems.firstValue = 6
        

    }
    func learn() {
        learnStoredProperties ()
    }
}
