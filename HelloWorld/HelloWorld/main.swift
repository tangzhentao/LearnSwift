//
//  main.swift
//  HelloWorld
//
//  Created by itang on 2019/6/29.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation


// 使用元祖返回多个值
func calculateStatistics(scores : [Int]) -> (min:Int, max:Int, sum:Int) {
    var min = scores[0]
    var  max = scores[0]
    var sum = 0
    
    for num in scores {
        if num < min {
            min = num
        } else if num > max {
            max = num
        }
        sum += num
    }
    
    return (min, max, sum)
}

let scores = [45, 99, 29, 60, 88, 12, 100]
let statistics = calculateStatistics(scores: scores)
print("min = \(statistics.min), max = \(statistics.max), sum = \(statistics.sum)")
print("min = \(statistics.0), max = \(statistics.1), sum = \(statistics.2)")

// 嵌套函数
func returnFifteen() -> Int {
    var y = 10
    
    func add () {
        y += 5
    }
    
    add ()
    
    return y
}

print("call returnFifteen: \(returnFifteen())")

// 函数作为返回值

func makeIncrementer () -> ( (Int) -> Int) {
    
    func addOne (num : Int) -> Int {
        return num + 1
    }
    
    return addOne(num:)
}

var funcAddOne = makeIncrementer()
var i = 1
i = funcAddOne(i)
print("i = \(i)")

// 把函数当参数
func hasAnyMatches( list: [Int], condition: ((Int) -> Bool) ) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}

func positive(num:Int) -> Bool {
    return (num > 0)
}

func nagtive(num: Int) -> Bool {
    return (num < 0)
}

var numList = [1, 2, 3, 4]
print(hasAnyMatches(list: numList, condition: positive(num:)))
print(hasAnyMatches(list: numList, condition: nagtive(num:)))

let newList = numList.map ({
    (number: Int) -> Int in
    let result = 3 * number
    return result
    
})
print(newList)

// 类和对象
class NamedShape {
    var numberOfSides = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Shape: deinit")
    }
    
    func simpleDescription () -> String {
        return "A \(self.name) shape with \(numberOfSides) sides."
    }
}

var shape = NamedShape(name: "simple")
shape.numberOfSides = 3
print(shape.simpleDescription())
shape = NamedShape(name: "complex")

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return (sideLength * sideLength)
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

let test = Square(sideLength: 6, name: "my test square")
print("test area = \(test.area())")
print(test.simpleDescription())

class Circle: NamedShape {
    var radius: Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 1
    }
    
    func area() -> Double {
        return (2 * Double.pi * radius * radius)
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius \(radius)"
    }
}

let circle = Circle(radius: 2, name: "my circle")
print("circle' area is \(circle.area())")
print(circle.simpleDescription())

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3 * sideLength
        }
        
        set {
            sideLength = newValue / 3
        }
    }
    
    override func simpleDescription() -> String {
        return "A equilateral triangle with sides of lenght \(sideLength)"
    }
    
}

var triangle = EquilateralTriangle(sideLength: 3, name: "my triangle")
print("triangle perimeter = \(triangle.perimeter)")
triangle.perimeter = 6
print("triangle' side length = \(triangle.sideLength)")

class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        triangle = EquilateralTriangle(sideLength: size, name: name)
        square = Square(sideLength: size, name: name)
    }
}

var triangleSquare = TriangleAndSquare(size: 4, name: "my triangle square")
print(triangleSquare.triangle.simpleDescription())
print(triangleSquare.square.simpleDescription())

triangleSquare.square = Square(sideLength: 10, name: "a square")
print(triangleSquare.triangle.simpleDescription())
print(triangleSquare.square.simpleDescription())

//let optionalSquare: Square? = Square(sideLength: 2, name: "xiao wang")
let optionalSquare: Square? = nil

let squareArea = optionalSquare?.area()
print("squareArea = \(squareArea ?? 0)")

/* 枚举和结构体 */

/**
 * 枚举
 * 和
 * 结构体
**/

/* 枚举 */
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queue, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queue:
            return "queue"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue
print("raw value: \(aceRawValue), text: \(ace.simpleDescription())")

func RankGreaterThan(x: Rank, y: Rank) -> Bool {
    return (x.rawValue > y.rawValue)
}

let x = Rank.eight
let y = Rank.ten
let greaterThan = RankGreaterThan(x: x, y: y)
if (true == greaterThan) {
    print("x > y")
} else {
    print("x <= y")
}
/* 结构体 */

/* 错误处理 */
enum PrinterError: Error {
    case outOfPage
    case noToner
    case noFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1000, toPrinter: "Bi sheng")
    print(printerResponse)
    
} catch {
    print(error)
}

do {
    let printerResponse = try send(job: 1001, toPrinter: "Never Has Toner")
    print(printerResponse)
    
} catch {
    print(error)
}

/*
let theBasics = TheBasics()
theBasics.test();

let basicOperators = BasicOperators()
basicOperators.learn()

let stringAndCharacters = StringsAndCharacters()
stringAndCharacters.learn()

ControlFlow().learn()

Functions().learn()
 */

//Closures().learn()

//Enumeration().learn()
//StructuresAndClasses().learn()

//Properties().learn()

//Methods().learn()

//Subscripts().learn()

//Ihheritance().learn()

//Initialization().learn()

//Deinitialization().learn()

//OptionalChainning().learn()

ErrorHandling().learn()





