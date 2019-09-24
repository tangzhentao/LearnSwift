//
//  OpaqueTypes.swift
//  HelloWorld
//
//  Created by tang on 2019/9/24.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

protocol Shape {
    func draw() -> String
}

struct Triangle: Shape {
    var size: Int
    func draw() -> String {
        var strings = [String]()
        
        for length in 1...size {
            strings.append(String(repeating: "*", count: length))
        }
        
        let resultString = strings.joined(separator: "\n")
        return resultString
    }
}

struct FlippedShape<T: Shape>: Shape {
    
    var originalShape: T
    func draw() -> String {
        let originalString = originalShape.draw()
        let originalLines = originalString.split(separator: "\n")
        let lines = originalLines.reversed()
        
        let string = lines.joined(separator: "\n")
        return string
    }
}

struct JoinedShap<T: Shape, U: Shape>: Shape {
    var top: T
    var bottom: U
    
    func draw() -> String {
        return top.draw() + "\n" + bottom.draw()
    }
}

// 返回不透明类型
struct Squrae: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let strings = Array<String>(repeating: line, count: size)
        let result = strings.joined(separator: "\n")
        return result
    }
}

//func makeTrapzoid() -> some Shape {
//    
//    let top = Triangle(size: 2)
//    
//    return top
//}

class OpaqueTypes {
    
    func learn() {
        let smallTriangle = Triangle(size: 3)
        print(smallTriangle)
        print(smallTriangle.draw())
        
        
        let flippedSamllTriangle = FlippedShape(originalShape: smallTriangle)
        print(flippedSamllTriangle)
        print(flippedSamllTriangle.draw())
        
        
        let joinedShap = JoinedShap(top: smallTriangle, bottom: flippedSamllTriangle)
        print(joinedShap)
        print(joinedShap.draw())
    }
    
}
