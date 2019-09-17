//
//  Protocols.swift
//  HelloWorld
//
//  Created by itang on 2019/9/14.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

protocol SomeProtocol {
    static var someProperty: Int {get set} // 类属性
    var mustBeSettable: Int {get set}
    var doesNotNeedToBeSettable: Int {get}
}

protocol FullNamed {
    var fullName: String {get}
}

struct Person: FullNamed {
    var fullName: String
}

class Starship: FullNamed {
    var prefix: String?
    var name: String
    
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    
    var fullName: String {
        return ( prefix == nil ? "" : prefix! + " " ) + name
    }
}

protocol RandomNumberGenerator {
    func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    
    func random() -> Double {
        lastRandom = (lastRandom * a + c).truncatingRemainder(dividingBy: m)
        return lastRandom / m
    }
}

protocol Togglable {
    mutating func toggle ()
}

enum OnOffSwitch: Togglable {
    case on, off
    
    mutating func toggle() {
        switch self {
        case .on:
            self = .off
        case .off:
            self = .on
        }
    }
}

// 定义初始化器的协议
protocol InitializationProtocol {
    init(someParameter: Int)
}
// 实现初始化协议的类
class someClass: InitializationProtocol {
    var count: Int
    
    required init(someParameter: Int) {
        count = someParameter
    }
}

class SomeSuperClass {
    init(someParameter: Int) {
        
    }
}

class SomeSubClass: SomeSuperClass, InitializationProtocol {
    required override init (someParameter: Int) {
        super.init(someParameter: someParameter)
    }
}

/* 协议作为类型来使用 */
class Dice {
    var sides: Int
    var generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

// 有条件遵循协议
protocol TextualRepresentable {
    var textualDescription: String {get}
}
struct Job: TextualRepresentable {
    var tile: String
    var salary: Double
    
    var textualDescription: String {
        return tile + ", " + "salary: \(salary)k"
    }
}
extension Array: TextualRepresentable where Element: TextualRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { (item) -> String in
            return item.textualDescription
        }
        
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

// 在扩展里声明采纳协议
struct Hamster {
    var name:String
    var textualDescription: String {
        return "a hamster named \(name)"
    }
}

extension Hamster: TextualRepresentable {}

// 类专属协议
protocol SomeClassOnlyProtocol: AnyObject {
    func printAllContent()
}

class Student: SomeClassOnlyProtocol {
    var name: String
    var studentID: Int
    
    init(name: String, ID: Int) {
        self.name = name
        self.studentID = ID
    }
    
    func printAllContent() {
        print("student:", name, studentID)
    }
}

// 结构体遵循类专属协议，会报编译时错误
//struct Book: SomeClassOnlyProtocol {
//    
//}

// 协议合成
protocol Named {
    var name: String {set get}
}

protocol Aged {
    var age: Int {set get}
}

struct Someone: Named, Aged {
    var name: String
    var age: Int
}

func wishHappyBirthday(to celebretor: Named & Aged) { // 使用协议组合
    print("Happy birthday", celebretor.name, "you are", celebretor.age)
}

class Location {
    var latitude: Double
    var longitude: Double
    
    init(latitude: Double, longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

class City: Location, Named {
    var name: String
    init(latitude: Double, longitude: Double, name: String) {
        self.name = name
        super.init(latitude: latitude, longitude: longitude)
    }
}

func beginConcert(in location: Location & Named) {
    print("Hello,", location.name)
}

// 检查协议的一致性
protocol HasArea {
    var area: Double {get}
}

class Protocols {
    
    class Circle: HasArea {
        let pi = 3.1415926
        var radius: Double
        
        init(radius: Double) {
            self.radius = radius
        }
        
        var area: Double {
            return 2 * pi * radius * radius
        }
    }
    
    class Country: HasArea {
        var area: Double
        init(area: Double) {
            self.area = area
        }
    }
    
    class Animal {
        var legs: Int
        init(legs: Int) {
            self.legs = legs
        }
        
    }
    
    func learn() {
        let john = Person(fullName: "lebron, ad, joho")
        print(john)
        
        let ncc1701 = Starship(name: "enterprise", prefix: "USS")
        print(ncc1701.fullName)
        
        let generator = LinearCongruentialGenerator()
        print("this is a random", generator.random())
        print("another is ", generator.random())
        
        var lightSwitch = OnOffSwitch.on
        print(lightSwitch)
        lightSwitch.toggle()
        print(lightSwitch)
        
        // 使用骰子
        let dice = Dice(sides: 6, generator: generator)
        for index in 0...5 {
            print(index, dice.roll())
        }
        
        // 使用条件协议的数组
        let androidJob = Job(tile: "Android", salary: 18.5)
        let iOSJob = Job(tile: "iOS", salary: 20.2)
        let serverJob = Job(tile: "server java", salary: 32.6)
        
        let jobs = [androidJob, iOSJob, serverJob]
        print("jobs:", jobs.textualDescription)
        
        let simonHamster = Hamster(name: "simon")
        let somethingTextualRepresentable: TextualRepresentable = simonHamster
        print(somethingTextualRepresentable.textualDescription)
        
        // 协议类型集合
        let managerJob = Job(tile: "project manager", salary: 50.8)
        let redHamster = Hamster(name: "red hamster")
        
        let things: [TextualRepresentable] = [managerJob, redHamster]
        for thing in things {
            print("thing:", thing.textualDescription)
        }
        
        
        let xiaoli = Someone(name: "xiao li", age: 16)
        wishHappyBirthday(to: xiaoli)
        
        let seattle = City(latitude: 25, longitude: -120, name: "seattle")
        beginConcert(in: seattle)
        
        // 检查协议的一致性
        let objects: [Any] = [Circle(radius: 2),
                              Country(area: 10000),
                              Animal(legs: 4)]
        
        for object in objects {
            if let objectWithArea = object as? HasArea {
                print("area is", objectWithArea.area)
            } else {
                print("something that doesn't have area.")
            }
        }
    }
}
