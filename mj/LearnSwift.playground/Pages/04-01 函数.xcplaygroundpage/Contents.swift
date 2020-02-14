//: [Previous](@previous)

import Foundation

func pi() -> Double {
    return 3.14
}

/// 求和
///
/// 将两个整数相加
///
///  - Parameter v1: 第1个整数
///  - Parameter v2: 第2个整数
///  - Returns: 两个整数的和
///
/// - Note: 传入两个整数即可
func sum(v1: Int, v2: Int) -> Int {
    return v1 + v2
}
sum(v1: 10, v2: 20)

/* 没有返回值，下面三个返回类型等价 */
func sayHello1() -> Void {
    print("hello")
}
func sayHello2() -> () {
    print("hello")
}
func sayHello3() {
    print("hello")
}
let result = sayHello3()
print(type(of: result))

/* 隐式返回 */
func add(v1: Int, v2: Int) -> Int {
    v1 + v2
}
add(v1: 10, v2: 20)

/* 返回元组 */
func calcute(v1: Int, v2: Int) -> (sum: Int, difference: Int) {
    return (v1 + v2, v1 - v2)
}
let (sum, difference) = calcute(v1: 20, v2: 10)

/* 参数标签 */
func startWork(at time: String) {
    print("start work at \(time)")
}
startWork(at: "9:00")

// 参数名默认也是参数标签
func add1(v1: Int, v2: Int) -> Int {
    v1 + v2
}
add(v1: 20, v2: 20)

// 参数标签可以省略
func add2(_ v1: Int, _ v2: Int) -> Int {
    v1 + v2
}
add2(20, 20)

/* 参数默认值 */
func check(name: String = "someone", age: Int, job: String = "none") {
    print("name: \(name), age: \(age), job: \(job)")
}

check(name: "john", age: 20, job: "farmer")
check(name: "tom", age: 20)
check(age: 20)

func test(_ first: Int = 10, middle: Int, _ last: Int = 30) {
    print("first: \(first), middle: \(middle), last: \(last)")
}

test(middle: 20, 40)

/* 可变参数 */
func sum(numbers: Int ...) -> Int {
    var sum = 0
    for i in numbers {
        sum += i
    }
    return sum
}
print("sum:", sum(numbers: 1, 2, 3, 4))

func scores(scores: Int ..., name: String) {
    var total = 0
    for score in scores {
        total += score
    }
    print("\(name) total score: \(total)")
}
scores(scores: 50, 90, 80, 70, name: "john")

/* 输入输出参数 */
func swapInteger(v1: inout Int, v2: inout Int) {
    let tmp = v1
    v1 = v2
    v2 = tmp
}
var v1 = 10, v2 = 20
swapInteger(v1: &v1, v2: &v2)
print("v1: \(v1), v2: \(v2)")

/* 函数重载 */
func sumInt(v1: Int, v2: Int) -> Int { print("原函数"); return 0}
func sumInt(v1: Int, v2: Double) -> Int {0} // 参数类型不同
func sumInt(x v1: Int, y v2: Int) -> Int {0} // 参数标签不同
func sumInt(_ v1: Int, v2: Int) -> Int {0} // 参数标签不同
func sumInt(_ v1: Int, _ v2: Int) -> Int { print("省略参数"); return 0} // 参数标签不同
func sumInt(v1: inout Int, v2: Int) -> Int {0} // 参数类型不同
func sumInt(v2: Int, v1: Int) -> Int {0} // 参数标签顺序不同，本质上是参数标签不同
func sumInt(v1: Int, v2: Int, v3: Int = 10) -> Int { print("三个参数，带默认参数"); return 0} // 参数个数不同

func sumInt(v1: Int ...) -> Int { print("可变参数"); return 0}
func sumInt(_ v1: Int ...) -> Int { print("可变参数，省略参数标签"); return 0}

func sumInt(v1: Int) -> Int { print("一个参数"); return 0}

let _ = sumInt(v1: 1) // 一个参数
let _ = sumInt(v1: 1, v2: 2) // 原函数，不是三个参数，带默认参数的函数

/*
 let _ = sumInt(1, 2)
 // 会报编译时错误：函数调用具有二义性，不知道要调用 sumInt(_ v1: Int, v2: Int) 还是 func sumInt(_ v1: Int ...)
 */


//: [Next](@next)
