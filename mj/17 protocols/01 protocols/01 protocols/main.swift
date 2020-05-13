//
//  main.swift
//  01 protocols
//
//  Created by void on 2020/5/12.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol RunProtocol {
    mutating func run() -> Int
}

protocol AnimalProtocol {
    var age: Int { get set}
    func breathe()
    
    static func getCount() -> Int
    
    subscript(index: Int) ->Int {get set}
}

struct Cat: AnimalProtocol, RunProtocol {
    static var count: Int = 0
    var age: Int {
        get {
            return 1
        }
        
        set {
            print("do nothing")
        }
    }
    func breathe() {
        print("hu~ xi~")
    }
    
    mutating func run() -> Int {
        print("run fast")
        age -= 1
        return age
    }
    
    func sleep(hours: Int = 8, at: String) {
        print("sleep \(hours) hours at", at)
    }
    subscript(index: Int) ->Int {
        get {
            return 0
        }
        set {
            print("do nothing")
        }
    }


    
    static func getCount() -> Int {
        return count
    }
}

class Dog: AnimalProtocol, RunProtocol {
    static var count: Int = 0
    var age: Int = 0
    func breathe() {
        print("hu~ xi~")
    }

    
     func run() -> Int {
        print("run fast")
        return 30
    }
    
    class func getCount() -> Int {
        return count
    }
    
    subscript(index: Int) ->Int {
        get {
            return 0
        }
        set {
            print("do nothing")
        }
    }
}

let cat = Cat()
cat.sleep(at: "bed")
cat.sleep(hours: 9, at: "proof")

