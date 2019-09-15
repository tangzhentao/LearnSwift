//
//  RectExtension.swift
//  HelloWorld
//
//  Created by itang on 2019/9/13.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

extension Rect {
    init(center: Point, size: Size) {
        let x = center.x - size.width / 2
        let y = center.y - size.height / 2
        let point = Point(x: x, y: y)
        //            self.init(point: point, size: size)
        
        self.init(origin: point, size: size)
        
    }
}

extension Int {
    func repetitions(task: ()->Void) {
        for _ in 0..<self {
            task()
        }
    }
    
    mutating func square () {
        self = self * self
    }
    
    subscript (index: Int) -> Int {
        // 123[0] 1 2
        var tmp = self
        for _ in 0..<index {
            tmp /= 10
        }
        tmp %= 10

        return tmp
    }
    
    enum Kind {
        case negative, zero, positive
    }
    
    var kind: Kind {
        
        switch self {
        case 0:
            return Kind.zero
        case let x where x > 0:
            return Kind.positive
        default:
            return Kind.negative
        }
    }
}
