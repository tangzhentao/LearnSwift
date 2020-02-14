
import Foundation

/// 常量
let ageInitLater: Int

func getAge() -> Int {
    return 10
}
ageInitLater = getAge()

/// 标识符
func 🐂🍺 () {
    print("666")
}

🐂🍺()

let 🥛 = "milk"
print(🥛)

class 🐂 {
    var weight = 0
}

struct 🐑 {
    var age = 0
}

let 🐂1 = 🐂()
let 🐑1 = 🐑()
print(🐂1)
print(🐑1)

/// 常见的数据类型

print(UInt16.max)
print(Int8.min)

let doubleNum = 1.0
let floatNum: Float = 1.0

/* 字面量 */

// 布尔
let bool = true
// 字符串
let string = "hello"
// 字符
let character1: Character = "c"
let character2: Character = "🐶"// 可存储ASCII字符、Unicode字符

// 整数
let decimal = 17
let binary = 0b10001 // 17的二进制
let octal = 0o21     // 17的八进制
let hexadecimal = 0x11// 17的十六进制
// 浮点数
let doubleDecimal1 = 60.0 // 60.0的十进制
let doubleHexadecimal1 = 0xFp2 // 60.0的十六进制，意思是15 X 2^2 = 60
let doubleHexadecimal2 = 0xFp-2 // 3.755的十六进制，意思是15 X 2^-2 = 3.75
// 以下都表示12.1875
let doubleDecimal2 = 12.1875 // 12.1875的十进制
let doubleDecimal3 = 1.21875e1 // 12.1875的十进制的科学技术法形式
let doubleHexadecimal3 = 0xC.3p0 // 12.1875的十六进制: (0xC + 1/16 * 3) * 2^0 = 12.1875
// p只能用于浮点数意思是2的多少次方，p2为2^2,p-2为2^-2
// e表示10的多少次方，不能用于16进制

// 整数和浮点数可以增加下划线或额外的0来增强可读性
let bigNum = 100_0000 // 一百万
let longNum = 1_000_000.000_001
let placeholder0 = 0001.2345

/* 类型转换 */

// 整数转换
let int1: UInt16 = 2000
let int2: UInt8 = 1
let int3 = int1 + UInt16(int2)
// 整数、浮点数转换
let int4 = 3
let double = 0.14159
let pi = Double(int4) + double
let intPi = Int(pi)
// 字面值可以直接相加，因为数字字面量本身没有类型
let pi1 = 3 + 0.14159

/* 元组 */
let http404Error = (404, "not found")
print("the status code is \(http404Error.0), description is \"\(http404Error.1)\"")

let (statusCode, statusDescripiton) = (404, "not found")
print("the status code is \(statusCode), description is \"\(statusDescripiton)\"")

let (status, _) = (404, "not found")
print("the status code is \(status)")

let http200 = (statusCode: 200, statusDescripiton: "success")
print("the status code is \(http200.statusCode), description is \"\(http200.statusDescripiton)\"")
