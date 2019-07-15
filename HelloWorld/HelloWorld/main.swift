//
//  main.swift
//  HelloWorld
//
//  Created by itang on 2019/6/29.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

let const1 = 10
let const2 = 10.0
var var1 = 1
var var2: Double = 1
var var3 = "hello"




print("Hello, World!")

print("const1 = , const2 = , var1 = , var2 = , var3 = ", const1, const2, var1, var2, var3)

var2 = 2
print(var2)

let with = 82
let label = "good"
let des = String(with) + label
print(des)

// 数字转字符串的快捷方式
let appleNum = 3
let orangeNum = 5
let appleSummary = "I have \(appleNum) apples"
let fruitSummary = "I have \(appleNum) apples and \(orangeNum) oranges"
print(appleSummary)
print(fruitSummary)

let score = 88.5
let name = "LiMei"
let studentSummary = "Li Mei gets \(score)"
print(studentSummary)

print("\(name) gets \(score)")

let qutation = """
I said I have \(appleNum) apples.
And then I said I have \(appleNum + orangeNum) fruits.
 ha ha ha...
    ha ha ha ~
"""

print(qutation)

// arry, dictionary
var shoppingList = ["apple", "orange", "bread"]
print(shoppingList)
shoppingList[2] = "banana"
print(shoppingList)

var occuptions = [
    "Li" : "HangZhou",
    "Wang" : "BeiJing",
]
print(occuptions)
occuptions["Li"] = "ShangHai"
occuptions["Zhao"] = "NanJing"
print(occuptions)

shoppingList = []
occuptions = [:]

print(shoppingList)
print(occuptions)

occuptions["song"] = "NanHai"
print(occuptions)

var ipList = [String]()
var cities = [String:String]()
cities["浙"] = "浙江"
cities["皖"] = "安徽"
print(ipList)
print(cities)

// 控制流

let individualScores = [75, 43, 100, 88, 20]
var teamScore = 0;

for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}

print("team score is \(teamScore)")

// 可选值变量
var optionalString : String? = "hello"
print(optionalString == nil)
optionalString = nil
print(optionalString == nil)

// 可选值与if的条件表达式
var optionalName : String? = "John"
optionalName = nil
var greeting = "hello"
if let name = optionalName {
    greeting = "hello, \(name)"
}
// ??操作符提供默认值
var nickName:String? = "asdf"
nickName = nil
var fullName = "L.B.J"
var informalGreeting = "Hello, \(nickName ?? fullName)"
print(informalGreeting)

// 强大的switch
var vegetable = "red pepper"
//vegetable = "watercress"
switch vegetable {
case "celegry":
    print("add some raisins and make ants on a log")
case "cucumber", "watercress":
    print("That would make a good tea sandwish.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)")
default:
    print("Everyting tastes good in soup.")
}

// 使用for - in 遍历字典
let interstingNumbers = ["prime" : [1, 2, 3, 5, 7],
                         "fib" : [1, 1, 2, 3, 5],
                         "square": [1, 4, 9, 16]]
for (kind, numbers) in interstingNumbers {
    print("\(kind): \(numbers)")
}

var largest = 0
for (_, numbers) in interstingNumbers {
    for num in numbers {
        if num > largest {
            largest = num
        }
    }
}

print("largest is \(largest)")

largest = 0
var largestKind = ""
for (kind, numbers) in interstingNumbers {
    for num in numbers {
        if num > largest {
            largest = num
            largestKind = kind
        }
    }
}

print("largest is \(largestKind) : \(largest)")

// while循环

var n = 1
while n < 100 {
    n *= 2
}

print("n = \(n)")

var m = 1
repeat {
    m *= 2
} while m < 100
print("m = \(m)")

for i in 0 ..< 10 {
    print("i = \(i)")
}

for i in 0 ... 10 {
    print("i = \(i)")
}

func greet (person : String, day : String) -> String {
    return "Hello, \(person), today is \(day)"
}

let hi = greet(person : "sam", day : "Saturday")
print(hi)

// 使用参数标签
func personInfo (_ person : String, is identity : String) {
    print("\(person) is \(identity)")
}

personInfo("Li ming", is: "a student")
personInfo("Wang er", is: "a tearcher")

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
