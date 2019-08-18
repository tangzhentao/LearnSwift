//
//  Inheritance.swift
//  HelloWorld
//
//  Created by itang on 2019/8/18.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Ihheritance {
    
    // 基类
    class Vehicle {
        var currentSpeed = 0.0
        var description: String {
            return "traveling at \(currentSpeed) mile(s) per hour"
        }
        
        func makeNoise () {
            
        }
    }
    
    // 子类
    class Bycle: Vehicle {
        var hasBasket = false
    }
    
    // 继承子类的子类
    class Trandem: Bycle {
        var currentNumberOfPassengers = 0
    }
    
    // 重写方法
    class Train: Vehicle {
        override func makeNoise() {
            print("To too")
        }
    }
    
    // 重写属性
    class Car: Vehicle {
        var gear = 1
        override var description: String {
            return super.description + " in \(gear) gear"
        }
    }
    
    // 重写属性观察器
    class AutoCar: Car {
        final override var currentSpeed: Double {
            didSet {
                gear = Int(currentSpeed / 10.0) + 1
            }
        }
        
    }
    
    func learn() {
        
        let vehicle = Vehicle()
        print("vehicle:", vehicle.description)
        
        let bycle = Bycle()
        bycle.currentSpeed = 15.0
        bycle.hasBasket = true
        print("bycle:", bycle.description)
        
        let trandem = Trandem()
        trandem.hasBasket = true
        trandem.currentSpeed = 22.0
        trandem.currentNumberOfPassengers = 2
        print("trandem:", trandem.description)
        
        let train = Train()
        vehicle.makeNoise()
        train.makeNoise()
        
        let car = Car()
        car.gear = 1
        car.currentSpeed = 12
        print("car:", car.description)
        
        let autoCar = AutoCar()
        autoCar.currentSpeed = 46
        print("autocar:", autoCar.description)
        
    }
}
