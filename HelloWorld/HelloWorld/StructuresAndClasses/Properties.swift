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

    // 类型属性
    func learnTypeProperties () {
        
        // 结构体的类型属性
        struct SomeStruct {
            static var storedProperty = 0
            static var computedProperty: Int {
                return 1
            }
        }
        
        enum SomeEnum {
            static var storedProperty = "some value"
            static var computedProperty: Int {
                return 2
            }
        }
        
        // 类的类型属性
        class SomeClass {
            static var storedProperty = 0
            static var computedProperty: Int {
                return 5
            }
            class var overrideableComputedProperty: Int {
                return 6
            }
        }
        
        print("struct type properties: ", SomeStruct.storedProperty, SomeStruct.computedProperty)
        print("enum type properties: ", SomeEnum.storedProperty, SomeEnum.computedProperty)
        print("class type properties: ", SomeClass.storedProperty, SomeClass.computedProperty, SomeClass.overrideableComputedProperty)
        SomeEnum.storedProperty = "other value"
        print("enum type properties: ", SomeEnum.storedProperty, SomeEnum.computedProperty)
        
        // 一个声道的例子来练习类型属性
        struct AudioChannel {
            static let thresholdLevel = 10
            static var maxInputLevelForAllChannels = 0
            var currentLevel: Int = 0 {
                didSet {
                    if currentLevel > AudioChannel.thresholdLevel {
                        currentLevel = AudioChannel.thresholdLevel
                    }
                    
                    if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                        AudioChannel.maxInputLevelForAllChannels = currentLevel
                        var leftAudioChannel = AudioChannel()
                        var rightAudioChannel = AudioChannel()
                        print("leftAudioChannel: ", leftAudioChannel.currentLevel, "max input level: ", AudioChannel.maxInputLevelForAllChannels)
                        leftAudioChannel.currentLevel = 7
                        print("leftAudioChannel: ", leftAudioChannel.currentLevel, "max input level: ", AudioChannel.maxInputLevelForAllChannels)
                        rightAudioChannel.currentLevel = 11
                        print("rightAudioChannel: ", rightAudioChannel.currentLevel, "max input level: ", AudioChannel.maxInputLevelForAllChannels)
                        
                    }
                }
            }
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
            
            learnTypeProperties ()
        }
    }
}
