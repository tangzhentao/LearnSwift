//
//  GenericsExtension.swift
//  HelloWorld
//
//  Created by itang on 2019/9/21.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

// 泛型的扩展
extension Generics.Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
