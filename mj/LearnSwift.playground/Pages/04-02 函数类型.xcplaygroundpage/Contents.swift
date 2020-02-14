//: [Previous](@previous)

import Foundation

func log1(x: Int) {
    print(#function, x)
}

func log2(x: inout Int) {
    print(#function, x)
}

var i = 1
var logFunc1: (Int) -> Void // 定义函数变量类型时，不能带参数标签
var logFunc2: (inout Int) -> Void

logFunc1 = log1
logFunc1(i) // 调用时不能带参数标签

logFunc2 = log2(x:)
logFunc2(&i)

/* 函数变量作为函数参数 */
func sum (x: Int, y: Int) -> Int {
    x + y
}
func difference (x: Int, y: Int) -> Int {
    x - y
}
func printResult(x: Int, y: Int, operation: (Int, Int)->Int) {
    print("operation result: \(operation(x, y))")
}

printResult(x: 3, y: 2, operation: sum(x:y:) )
printResult(x: 3, y: 2, operation: difference)

/* 函数变量作为返回值 */

func next(x: Int) -> Int {
    x + 1
}
func previous(x: Int) -> Int {
    x - 1
}

func action(forward: Bool) -> (Int)->Int {
    forward ? next : previous(x:)
}
var actionFun = action(forward: true)
print("action:", actionFun(2))
actionFun = action(forward: false)
print("action:", actionFun(2))

/* 给类型起别名 */
typealias Byte = Int8
typealias Date = (year: Int, month: Byte, day: Byte)
typealias TwoInOneOutFuncType = (Int, Int) -> Int

func printDate(date: Date) {
    print("\(date.year)-\(date.month)-\(date.day)")
}
printDate(date: (2020, 02, 13))

// 使用函数类型别名
let add: TwoInOneOutFuncType = sum(x:y:)
func setAdd(add: TwoInOneOutFuncType) {}
func getAdd() -> TwoInOneOutFuncType { sum(x:y:) }

/* 嵌套函数 */
func forward(_ forward: Bool) -> (Int)->Int {
    func next_(x: Int) -> Int {
        x + 1
    }
    func previous_(x: Int) -> Int {
        x - 1
    }
    return forward ? next_ : previous_
}
print(forward(true)(6))
print(forward(false)(6))
//: [Next](@next)
