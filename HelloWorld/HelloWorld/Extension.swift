//
//  Extension.swift
//  HelloWorld
//
//  Created by itang on 2019/9/13.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Extension {
    
    func printIntegerKinds(_ numbers: [Int]) {
        for num in numbers {
            switch num.kind {
            case .zero:
                print("0", terminator: " ")
            case .positive:
                print("+", terminator: " ")
            case .negative:
                print("-", terminator: " ")
            }
        }
        print("")
    }
    
    func learn() {

        let rect = Rect(center: Point(x: 10, y: 10), size: Size(width: 10, height: 10))
        
        print(rect)
        
        3.repetitions {
            print("hello")
        }
        
        var someInt = 10
        let tmpInt = someInt
        someInt.square()
        print("\(tmpInt) squrae:", someInt)
        
        let num = 12345
        print("0 bit:", num[0])
        print("1 bit:", num[1])
        print("2 bit:", num[2])
        print("3 bit:", num[3])
        print("4 bit:", num[4])
        print("5 bit:", num[5])
        print("6 bit:", num[6])
        
        let numbers = [0, 8, 9, -1, 12, -6, -9, 8]
        printIntegerKinds(numbers)

    }
}

class foo {
    var name = ""
}

class hoo {
    var num = 0
}

class fh: foo {
    func say() {
        print("hello")
    }
}
