//: [Previous](@previous)

import Foundation

// 闭包表达式
var add = {
    (a: Int, b: Int) -> Int in
    return a + b
}

let result = add(1, 2)
print("result:", result)

// 匿名闭包
/*
匿名闭包，老是报错
 { (a: Int, b:Int) in print("hello")
 }(1, 2)
*/

func exec(v1: Int, v2: Int, fn: (Int, Int) -> Int) {
    print(fn(v1, v2))
}

// 闭包的各种简写形式
func testClosureShorthand() -> Void {
    
    print("\n测试闭包的各种简写形式")
    
    // 不简写
    exec(v1: 1, v2: 1, fn: {
        (a: Int, b: Int) -> Int in
        return a + b
    })
    
    // 省略闭包参数和返回值类型，因为函数exec的参数fn中已经定义了这些类型，所以可以推断出闭包的参数和返回值类型
    exec(v1: 1, v2: 2, fn: {
        a, b in
        return a + b
    })
    
    // 省略闭包函数体重的return关键字
    exec(v1: 1, v2: 3, fn: {
       a, b in
       a + b
    })
    
    // 省略参数名，在闭包中可以使用$0、$1表示参数
    exec(v1: 1, v2: 4, fn: {
       $0 + $1
    })
    
    // 之所以能这样省略，是因为 + 是个函数
    exec(v1: 1, v2: 5, fn: +)
}

testClosureShorthand()

func testTailingClosure () {
    print("\n测试尾随闭包")
    
    // 未简写的尾随闭包
    exec(v1: 1, v2: 2) {
        (a: Int, b: Int) -> Int in
        return a + b
    }
    
    // 省略参数返回值类型、return关键字的尾随闭包
    exec(v1: 1, v2: 3) { (a, b) in
        a + b
    }
    
    // 省略参数名的尾随闭包
    exec(v1: 1, v2: 4) {
        $0 + $1
    }
    
    /*
     如果函数只有一个参数，且是闭包表达式类型，则使用尾随闭包时，可以省略()
     */
    func exec(fn: () -> Void) {
        fn()
    }
    
    exec(fn: {
        () -> Void in
        print("hello 1")
    })
    
    exec(fn: {
        print("hello 2")
    })
    
    // 尾随闭包
    exec () {
        print("hello 3")
    }
    
    // 省略调用()的尾随闭包
    exec {
        print("hello 4")
    }

}
testTailingClosure ()

func testSortArray () {
    print("\n测试使用闭包表达式排序数组")
    let array = [3, 9, 2, 7, 8 ,5, 1]
    
    // 按升序排序
    print(array.sorted())
    
    let sortedArray = array.sorted {
        $0 > $1
    }
    
    print(sortedArray)
    
}
testSortArray ()


// 闭包

func getFn() -> (Int)->Int {
    var num = 0
    func add(a: Int) -> Int {
        num += a
        return num
    }
    
    return add
}

func testClosures () {
    print("\n测试闭包")

    let addFn1 = getFn()
    let addFn2 = getFn()
    let addFn3 = getFn()
    let addFn4 = getFn()

    print(addFn1(1)) // 1
    print(addFn2(2)) // 3
    print(addFn3(3)) // 6
    print(addFn4(4)) // 10
    
    let addFn = getFn()
    print(addFn(1)) // 1
    print(addFn(2)) // 2
    print(addFn(3)) // 3
    print(addFn(4)) // 4

}
testClosures ()

//: [Next](@next)
