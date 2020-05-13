//
//  main.swift
//  04 protocol_inheritance
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/* 协议继承 */
protocol LivabelProtocol {
    func breathe()
}

protocol DogProtocol: LivabelProtocol {
    func run()
}

class Dog: DogProtocol {
    func breathe() {
        print("dog breathe")
    }
    func run() {
        print("dog run")
    }
}

let dog = Dog()
dog.breathe()
dog.run()

