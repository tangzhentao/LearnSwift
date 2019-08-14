//
//  StructuresAndClasses.swift
//  HelloWorld
//
//  Created by tang on 2019/8/13.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

class StructuresAndClasses {
    
    func useStructuresAndClasses () {
        let someResolution = Resolution()
        let someVideoMode = VideoMode ()
        print(someResolution)
        print(someVideoMode.resolution.width)
        
        // 结构体类型的成员逐一构造器
        let vga = Resolution(width: 1080, height: 920)
        // 结构体是值类型
        var hd = vga // 值传递
        hd.width = 2048
        print("vga: \(vga)")
        print("vga: \(hd)")
        
        // 枚举类型也是值类型
        enum CompassPoint {
            case east, west, north, south
            mutating func turnNorth() {
                self = .north
            }
        }
        
        var currentDirection = CompassPoint.west
        let rememberedDirection = currentDirection // 值传递
        currentDirection.turnNorth()
        print("current direction: \(currentDirection)")
        print("remembered direction: \(rememberedDirection)")
        
        // 类时引用类型
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        
        // 引用传递
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30
        
        print("tenEighty frameRate: \(tenEighty.frameRate)")
        print("alsoTenEighty frameRate: \(alsoTenEighty.frameRate)")
        
        if tenEighty === alsoTenEighty {
            print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
        }

    }
    
    func learn() {
        useStructuresAndClasses ()
    }
}
