//
//  Enumeration.swift
//  HelloWorld
//
//  Created by itang on 2019/8/10.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

// 下面的枚举成员不会隐式的赋值为0、1、2、3
enum CompassPoint {
    case east
    case west
    case south
    case north
}

enum Planet {
    case mecry, venus, earth, mars, jupiter, saturn, uranus, neputune
}

class Enumeration {
    
    func testPrintValue () {
        
        
        var directionToHead = CompassPoint.east
        print(directionToHead)
        directionToHead = .west // 通过上文的赋值可知，direction是CampassPoint枚举类型，因此可以使用这种简写方式
        print(directionToHead)
        
        describe(compassPoint: directionToHead)
        
        let planet = Planet.mars
        describe(planet: planet)
        
    }
    
    func describe(compassPoint: CompassPoint) {
        switch compassPoint {
        case .east:
            print("where the sun rises.")
        case .west:
            print("where the skies is blune.")
        case .south:
            print("watch out for pengunis")
        case .north:
            print("lots of planets have a north")
        }// 这个switch语句已经是完备的了，不需要default分支。 说他是完备的是因为他穷举了枚举类型CampassPoint所有的情况
    }
    
    func describe(planet: Planet) {
        switch planet {
        case .earth:
            print("mostly harmless.")
        default:
            print("not safe place for human.")
        }
    }
    
    // 类似联合体的枚举类型 upc: universal product code
    enum BarCode {
        case upc(Int, Int, Int, Int)
        case qrCode(String)
    }
    
    func useBarCode () {
        var barCode1 = BarCode.upc(8, 12345, 49857, 3)
        print("barCode1: \(barCode1)")
        printProduct(barCode: barCode1)
        
        barCode1 = BarCode.qrCode("special product 001")
        print("barCode1: \(barCode1)")
        printProduct2(barCode: barCode1)

    }
    
    func printProduct(barCode: BarCode) {
        switch barCode {
        case .upc(let numberSystem, let manufacture, let product, let check):
            print("produt upc: \(numberSystem)-\(manufacture)-\(product)-\(check)")
        case .qrCode(let codeString):
            print("product qrcode: \(codeString)")
        }
    }
    
    // 更简洁的形式
    func printProduct2(barCode: BarCode) {
        switch barCode {
        case let .upc( numberSystem, manufacture, product, check):
            print("produt upc: \(numberSystem)-\(manufacture)-\(product)-\(check)")
        case .qrCode(let codeString):
            print("product qrcode: \(codeString)")
        }
    }
    
    // 使用原始值
    enum Grade: Int {
        case E = 0
        case D = 1
    }
    
    func learn() {
        testPrintValue ()
        
        useBarCode ()
    }
}
