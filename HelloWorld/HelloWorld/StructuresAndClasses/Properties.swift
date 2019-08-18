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

class Properties {
    
    func learnStoredProperties () {
        var rangOfThreeItems = FixedLengthRange(firstValue: 3, length: 3)
        rangOfThreeItems.firstValue = 6
        

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
                    }
                }
            }
        }
        
        var leftAudioChannel = AudioChannel()
        var rightAudioChannel = AudioChannel()
        print("leftAudioChannel: ", leftAudioChannel.currentLevel, "max input level: ", AudioChannel.maxInputLevelForAllChannels)
        leftAudioChannel.currentLevel = 7
        print("leftAudioChannel: ", leftAudioChannel.currentLevel, "max input level: ", AudioChannel.maxInputLevelForAllChannels)
        rightAudioChannel.currentLevel = 11
        print("rightAudioChannel: ", rightAudioChannel.currentLevel, "max input level: ", AudioChannel.maxInputLevelForAllChannels)

    }
    func learn() {
        learnStoredProperties ()
        
        
        learnTypeProperties ()
    }
}
