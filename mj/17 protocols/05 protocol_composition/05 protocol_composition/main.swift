//
//  main.swift
//  05 protocol_composition
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol LivableProtocol {
    func breathe()
}
protocol MovableProtocol {
    func run()
}

class Tree: LivableProtocol {
    func breathe() {
        print("tree breathe")
    }
}

class Ant: LivableProtocol {
    func breathe() {
        print("Ant breathe")
    }
}

class Dog: MovableProtocol {
    func run() {
        print("dog run")
    }
}

// 参数为Dog及其子类
func fn0(obj: Dog) {
    
}

// 参数为遵守LivableProtocol的类型
func fn1(obj: LivableProtocol) {
    
}

// 参数为遵守LivableProtocol且MovableProtocol的类型
func fn2(obj: LivableProtocol & MovableProtocol) {
    
}

// 参数为Dog及其子类, 且遵守LivableProtocol且MovableProtocol
func fn3(obj: Dog & LivableProtocol & MovableProtocol) {
    
}

typealias HealthyDog = Dog & LivableProtocol & MovableProtocol
func fn4(obj: HealthyDog)  {
    
}
