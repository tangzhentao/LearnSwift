//: [Previous](@previous)

import Foundation

/* if-else */
let age = 22
if (age < 10) {
    print("children")
} else if age < 50 { // 条件表达式外的小括号可以省略
    print ("guy")
} else { // 大括号不能省略，即使只用一行代码
    print("old")
}

/* if后面的条件只接受Bool类型，不接受其他类型，包括Int
let notBool = 1
if notBool {
    print("true")
}
*/

/* while */
var count = 0
while count < 5 {
    print("\(count) time")
    count += 1
}

// 相当于C语言中的do-while
var num = 0
repeat {
    num += 1
    print("repat \(num)")
} while num < 0


/* for-in */
for i in 0...3 { // 使用区间、不能省略大括号
    print("闭区间: \(i)")
}
for i in 0..<3 {
    print("左闭右开区间: \(i)")
}

let begin = 0
let end = 3
for var i in begin...end {
    i += 5
    print("可变的i: \(i)")
}
for i in begin...3 {
    print("左变量, 右字面值: \(i)")
}
for i in 0...end {
    print("左字面值, 右变量: \(i)")
}

let rangeInFor = 0...3
for i in rangeInFor {
    print("区间i: \(i)")
}

/* 区间运算符用着数组上 */
let characters: [Character] = ["a", "b", "c", "d"]
for c in characters {
    print("打印全部字符：\(c)")
}

for c in characters[0...2] {
    print("打印前三个字符：\(c)")
}
for c in characters[1...] {
    print("单侧区间，向右尽可能延伸：\(c)")
}
for c in characters[...2] {
    print("单侧区间，向左尽可能延伸：\(c)")
}

let singleRange = ...5 // 包含小于等于5的所有整数
print("是否包含5：\(singleRange.contains(5))")
print("是否包含6：\(singleRange.contains(6))")
print("是否包含0：\(singleRange.contains(0))")
print("是否包含-1000：\(singleRange.contains(-1000))")

/* 区间类型 */
let closedRange: ClosedRange<Int> = 1...3
let range: Range<Int> = 1..<3
let partialRange: PartialRangeThrough<Int> = ...3

/* 字符、字符串使用区间运算符 */
let characterRange: ClosedRange<Character> = "a"..."c"
print("测试字符区间")
print(characterRange.contains("a"))
print(characterRange.contains("b"))
print(characterRange.contains("c"))
print(characterRange.contains("d")) // false
let stringRange = "bb"..."cc"// bb bc --> bz b'127'
                             // c'0' --> cc

print("测试字符串区间")
print(stringRange.contains("bb"))
print(stringRange.contains("bc"))
print(stringRange.contains("bz"))
print(stringRange.contains("b~")) // ~ ASCII值是126，最大是127

print(stringRange.contains("c\0")) // \0的ASCII值是0，第一个ASCII字符
print(stringRange.contains("ca"))
print(stringRange.contains("cb"))
print(stringRange.contains("cc"))

print(stringRange.contains("ab")) // false
print(stringRange.contains("cd")) // false



/* 字符、字符串区间不能用于for-in
for c in characterRange {
    print(c)
}
*/

/* 带间隔的区间 */
for i in stride(from: 0, to: 10, by: 2) {
    print("左闭右开区间: \(i)")
}
for i in stride(from: 0, through: 10, by: 2) {
    print("闭区间: \(i)")
}

/* switch */
var score = 90
switch score {
case let s where s < 60:
    print("不及格")
case let s where s < 80:
    print("及格")
case let s where s < 100:
    print("优秀")
    fallthrough
default:
    print("我就知道你可以")
}

/* 复合条件 */
let name = "john"
switch name {
case "john", "jobs": // 复合条件
    print("自己人")
default:
    print("不是自己人")
}

/* 区间匹配、元组匹配 */
print("** 区间匹配 **")
score = 66
switch score {
case 0..<60:
    print("不及格")
case 60..<80:
    print("及格")
case 80..<100:
    print("优秀")
    fallthrough
default:
    print("我就知道你可以")
}
print("** 元组匹配 **")
var point = (1, 1)
switch point {
case (0, 0):
    print("原点")
case (_, 0):
    print("在x轴上")
case (0, _):
    print("在y轴上")
default:
    print("不在轴上")
}

/* 值绑定 */
print("\n** 值绑定 **")
switch point {
case (0, 0):
    print("原点")
case (let x, 0):
    print("在x轴上: \(x)")
case (0, var y):
    y += 1
    print("在y轴上: \(y)")
case let (x, y):
    print("不在轴上: \(x), \(y)")
}

/* where */
print("\n** case where **")
point = (-1, 1)
switch point {
case let (x, y) where x == y:
    print("在线y = x上")
case let (x, y) where x == -y:
    print("在线y = -x上")
case (_, _):
    print("其他情况")
}

// 把数组中的正数相加
print("\n** for where **")
let nums = [1, -1, 2, -2, 3, -3]
var sum = 0
for i in nums where i > 0 {
    sum += i
}
print("数组中正数的和为：\(sum)")

/* 标签 */
print("\n** 标签 **")
let innerNums = [3, 2, 5]
sum = 0
outer: for i in nums {
    for j in innerNums {
        if i == j {
            break outer
        }
        sum = sum + i + j
    }
}
print("两数组的和为：\(sum)")

//: [Next](@next)

/* 标签语句 */

