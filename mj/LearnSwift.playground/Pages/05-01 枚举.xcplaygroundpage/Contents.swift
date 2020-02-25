//: [Previous](@previous)

import Foundation

/* 枚举的基本用法 */
enum Direction {
    case East
    case West
    case South
    case North
}

enum Gender {
    case male, female, secret
}

enum Moth {
    case yi, er, san
    case si, wu, liu
    case qi, ba, jiu
    case shi, shiyi, shier
}

var gender: Gender = .secret
switch gender {
case .male:
    print("男")
case .female:
    print("女")
default :
    print("保密")
}

var direction = Direction.East
direction = .South
switch direction {
case .East:
    print("East")
case .West:
    print("West")
case .South:
    print("South")
case .North:
    print("South")
}

/* 关联值 */
enum Score {
    case point(Int)
    case grade(Character)
}

var score = Score.point(88)
score = .grade("A")
switch score {
case .point(let x):
    print("point:", x)
case let .grade(x):
    print("grade:", x)
}

enum Date {
    case digit(year: Int, month: Int, day: Int)
    case string(String)
}
var date = Date.string("2020-02-24")
print(date)
date = .digit(year: 2020, month: 02, day: 24)
print(date)

switch date {
case .digit(year: let y, month: let m, day: var d):
    d += 1
    print("next day: \(y)-\(m)-\(d)")
case .string(let x):
    print(x)
}

/* 关联值举例 -- 手机密码 */
enum  Password {
    case numbers([Int])
    case gesture(String)
}

var password = Password.numbers([4, 8, 2, 6])
func testPassword(_ password: Password) {
    switch password {
    case .numbers(let nums):
        print("numbers:", nums)
    case .gesture(let str):
        print("gesture:", str)
    }
}
testPassword(password)
password = .gesture("478256")
testPassword(password)


/* 原始值 */
enum PokerSuit: Character {
    case space = "♠"
    case heart = "♥"
    case diamond = "◇"
    case club = "♣"
}
var suit = PokerSuit.space
print(suit, suit.rawValue)

enum Grade: String {
    case perfect = "A", great = "B", good = "C", bad = "D"
}
var grade = Grade.perfect
print(grade, grade.rawValue)
var g1 = Grade(rawValue: "B")
if let g = g1 {
    print(g, g.rawValue)
}

/* 隐式原始值 */
enum Weekday: Int {
    case monday = 1, tuesday, wednesday, thursday = 5, friday
}
print("monday:", Weekday.monday.rawValue) // monday: 1
print("tuesday:", Weekday.tuesday.rawValue) // tuesday: 2
print("friday:", Weekday.friday.rawValue) // friday: 6
enum OS: Int8 {
    case iOS
    case Android
}
print(OS.iOS, OS.iOS.rawValue) // iOS 0
print(OS.Android, OS.Android.rawValue) // Android 1

enum Season: String {
    case spring, summer, autumn, winter
}
print(Season.spring, Season.spring.rawValue) // spring spring

/* 递归枚举 */
indirect enum ArthExp {
    case number(Int)
    case sum(ArthExp, ArthExp)
    case difference(ArthExp, ArthExp)
}

// (4 + 8) - (8 - 4)
let n1 = ArthExp.number(4)
let n2 = ArthExp.number(8)
let sum = ArthExp.sum(n1, n2)
let diff = ArthExp.difference(n2, n1)
let expression = ArthExp.difference(sum, diff)

func calculate(_ expression: ArthExp) -> Int {
    var result = 0
    switch expression {
    case .number(let x):
        result = x
    case let .sum(x, y):
        result = calculate(x) + calculate(y)
    case let .difference(x, y):
        result = calculate(x) - calculate(y)
    }
    return result
}

let result = calculate(expression)
print("(4 + 8) - (8 - 4) =", result)

//: [Next](@next)
