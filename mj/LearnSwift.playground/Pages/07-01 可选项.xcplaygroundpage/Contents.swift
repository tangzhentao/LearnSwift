//: [Previous](@previous)

import Foundation


/* 可选项 */
var i: Int?
print(i)
i = 10
print(i)

var name: String? = "john"
print(name)
name = nil
print(name)

let array = [10, 19, 40, 20, 50]

func get(index: Int) -> Int? {
    
    if index < 0 || index >= array.count
    {
        return nil
    }
    return array[index]
}

var item = get(index: 0)
print(item)
item = get(index: 10)
//print(item)

/* 强制解包 */
func forceUnwrap () {
    print("force unwrap")
    
    var wrappedInt: Int? = 10
    var number: Int = wrappedInt!
    print("number:", number)
    wrappedInt = nil
    //number = wrappedInt! // 强制解包 nil 导致crash
    
    let wrappedNum = Int("123")
    if wrappedInt != nil {
        print("字符串转整数成功:", wrappedNum!)
    } else {
        print("字符串转整数失败")
    }
    
}
forceUnwrap ()

/* 可选项绑定 */
func optionalBinding () {
    print("")
    print("可选项绑定")

    var wrappedInt: Int? = Int("6")
    func printBoolValue(_ value: Bool) {
        print("result: \(value)")
    }
    
    while let number = wrappedInt {
        print("while number:", number)
        break
    }
    
    if let number = wrappedInt {
        print("number:", number)
    } else {
        print("字符串转整数失败")
    }
    wrappedInt = Int("六")
    if let number = wrappedInt {
        print("number:", number)
    } else {
        print("字符串转整数失败")
    }
    
    /* 有两个包装Int可选项 first、second，如果firstc包装值 < second包装值 < 100， 则打印两个包装数据的值 */
    let first: Int? = 6
    let second: Int? = 60
    
    if let f = first {
        if let s = second {
            if f < s && s < 100 {
                print("first: \(f), second: \(s)")
            }
        }
    }
    
    // 等价的代码
    if let f = first,
        let s = second,
        f < s && s < 100 {
        
        print("first: \(f), second: \(s)")
    }
    
    let i = 10, j = 20
    if i < j,
        j < 30 {
        print("i: \(i), j: \(j)")
    }
    
    var c1 = 10, c2 = 1
    while  c1 < 24, c2 < 24  { // c1 < 24 && c2 < 24
        print("c1: \(c1), c2: \(c2)")
        c1 += 1
        c2 += 2
    }
}
optionalBinding()

/* 空合并运算符 */
func nilCoalescingOperator () {
    print("空合并运算符")
    
    let a: Int? = 1
    let b: Int? = 2
    let c = a ?? b
    print(c) // Optional(1)
    
    let a1: Int? = nil
    let b1: Int? = 2
    let c1 = a1 ?? b1
    print(c1) // Optional(2)
    
    let a2: Int? = 1
    let b2: Int = 2
    let c2 = a2 ?? b2 // 自动解包 1
    print(c2) // 1
    
    let a3: Int? = nil
    let b3: Int? = nil
    let c3 = a3 ?? b3 // nil
    print(c3) // nil
    
    let a4: Int? = nil
    let b4: Int = 2
    let c4 = a4 ?? b4 // 2
    print(c4) // 2
    
    /* 多个??一起使用 */
    let a5: Int? = 1
    let b5: Int? = 2
    let c5 = a5 ?? b5 ?? 3 // c5：Int 1
    print(c5)
    
    let a6: Int? = nil
    let b6: Int? = 2
    let c6 = a6 ?? b6 ?? 3 // c6：Int 2
    print(c6)
    
    let a7: Int? = nil
    let b7: Int? = nil
    let c7 = a7 ?? b7 ?? 3 // c7：Int 3
    print(c7)
    
    
    /* ?? 跟if let配合使用 */
    let a8: Int? = nil
    let b8: Int? = 2
    if let c8 = a8 ?? b8 {
        print(c8)
    }
    
    /*
     运行时错误
     ?? 与可选绑定配合使用时，要保证??的结果是可选项
    if let c8 = a8 ?? b8 ?? 3 {
        print(c8)
    }
    */
}
nilCoalescingOperator()

/* 实例 */
func login() {
    
    login(info: ["username" : "jobs", "password" : "1234"])
    login(info: ["username" : "jobs"])
    login(info: ["password" : "1234"])
    
    login_guard(info: ["username" : "jobs", "password" : "1234"])
    login_guard(info: ["username" : "jobs"])
    login_guard(info: ["password" : "1234"])
}

func login(info: [String:String]) {
    let username: String
    if let tmp = info["username"] {
        username = tmp
    } else {
        print("请输入用户名")
        return
    }
    
    let password: String
    if let tmp = info["password"] {
        password = tmp
    } else {
        print("请输入密码")
        return
    }
    
    print("用户名: \(username), 密码: \(password), 登录中...")
}

/*
 使用guard 更简洁
 */
func login_guard(info: [String:String]) {
    guard let username = info["username"] else {
        print("请输入用户名")
        return
    }
    
    guard let password = info["password"] else {
        print("请输入密码")
        return
    }
    
    print("用户名: \(username), 密码: \(password), 登录中...")
}

login()
//: [Next](@next)
