//
//  main.swift
//  02 init_in_protocol
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation


protocol InitProtocol {
    init()
}

// init需要加required的情况
func requiredInit() {
   
    class Dog: InitProtocol {
        var age = 0
        required init() {
            print("dog init")
        }
    }
    
    let _ = Dog()
}
//requiredInit()

// init需要加required和override的情况
func requiredOverrideInit() {
    class Animal {
        init() {
            print("Animal init")
        }
        
        init(msg: String) {
            print("Animal init", msg)
        }
    }
    
    class Dog: Animal, InitProtocol {
        var age: Int
        required override init() {
            print("dog init")
            age = 1
            super.init(msg:"hahah")
        }
    }
    
    let _ = Dog()

}
requiredOverrideInit()
