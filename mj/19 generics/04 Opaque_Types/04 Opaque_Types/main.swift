//
//  main.swift
//  04 Opaque_Types
//
//  Created by void on 2020/5/15.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol Living {
    func breathe()
}



// 返回类型可以协议类型
func returnTypeIsProtocol() {
    class Cat: Living {
        func breathe() {
            print("Cat breathe")
        }
        func run() {
            print("Cat run")
        }
        
    }

    class Dog: Living {
        typealias Speed = Double
        func breathe() {
            print("Dog breathe")
        }
        func run() {
            print("Dog run")
        }
    }
    
    func getLiving(_ index: Int) -> Living {
        if 0 == index {
            return Cat()
        } else {
            return Dog()
        }
    }
    
    let liver = getLiving(0)
    liver.breathe()
//    liver.run() // 访问不了run方法，只能访问到Living协议中的方法，达到了隐藏细节的目的
}


protocol Runalbe {
    associatedtype Speed
    var speed: Speed { get }
    func run()
}

func test() {
    class Dog: Runalbe {
        typealias Speed = Double
        var speed: Speed {
            return 20.0
        }
        func run() {
            print("Dog run")
        }
    }
    
//    func getRunner() -> Runalbe {
//           return Dog()
//    }
    
    func getRunner1<T: Runalbe>() -> T {
        return Dog() as! T
    }
}
