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

var globalVar: Int = 0 {
    willSet {
        print("will set globalVar to \(newValue)")
    }
    
    didSet {
        print("did set globalVar from \(oldValue) to \(globalVar)")
    }
}

class Properties {
    
    // 存储属性
    func learnStoredProperties () {
        var rangOfThreeItems = FixedLengthRange(firstValue: 3, length: 3)
        rangOfThreeItems.firstValue = 6
    }
    
    // 计算属性
    func learnComputedProperties () {
        
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Size {
            var width = 0.0, height = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size()
            
            var center: Point {
                 get {
                 let centerX = origin.x + (size.width) / 2
                 let centerY = origin.y + (size.height) / 2
                 return Point(x: centerX, y: centerY)
                 }
 
                // getter 可以简化为
                /* 需要新版本支持
                 get {
                 Point(x: origin.x + (size.width) / 2, y: origin.y + (size.height) / 2)
                 }
                 */
                
                
                /*
                set (newCenter) {
                    origin.x = newCenter.x - (size.width) / 2
                    origin.y = newCenter.y - (size.height) / 2
                }
                 */
                
                // setter 可以省略参数，可简化为
                set {
                    origin.x = newValue.x - (size.width) / 2
                    origin.y = newValue.y - (size.height) / 2
                }
            }
            
            // 只读计算属性
            var area: Double {
                return size.width * size.height
            }
        }
        
        var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
        let initialSquareCenter = square.center
        print("squre center: \(initialSquareCenter)")
        square.center = Point(x: 20, y: 20)
        print("squre center: \(square.center)")

    }
    
    // 属性观察器
    func learnPropertyObservers () {
        
        // 定义一个类
        class StepCounter {
            var totalSteps: Int = 0 {
                willSet (newTotalSteps) {
                    print("will set totalSteps to \(newTotalSteps)")
                }
                
                didSet {
                    if totalSteps > oldValue {
                        print("added \(totalSteps - oldValue)")
                    }
                }
            }
        }
        
        // 使用这个类
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        stepCounter.totalSteps = 360
        stepCounter.totalSteps = 896
    }
    
    //
    func learnGlobalVarObsever () {
        globalVar = 3
        globalVar = 5
    }
    
    func learn() {
        learnStoredProperties ()
        
        learnComputedProperties ()
        
        learnPropertyObservers ()
        
        learnGlobalVarObsever ()
    }
}
