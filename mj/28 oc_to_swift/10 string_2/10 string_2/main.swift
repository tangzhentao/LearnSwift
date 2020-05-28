//
//  main.swift
//  10 string_2
//
//  Created by void on 2020/5/27.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### substring
 - String可以通过下标、prefix、suffix等截取子串，子串类型不是String类型而是Substring类型
 - Substring和它的原字符串共享内存
 - 在需要的时候，会为Substring重新分配内存，比如Substring转String的时候
 */


/*
 测试发现，从str和substr的地址中没有看出什么联系
 */
func check(str: inout String, substr: inout Substring) {
    print(String(repeating: "*", count: 16))
    let strPtr = withUnsafePointer(to: &str) {$0}
    let substrPtr = withUnsafePointer(to: &substr) {$0}
    print("str<\(strPtr)>:", str)
    print("substr<\(substrPtr)>:", substr)
    print("")
}

var str = "123456"

// 获取子串
var substr1 = str.prefix(3) // 123

var substr2 = str.suffix(3) // 456
let range = str.startIndex..<str.index(str.startIndex, offsetBy: 3)
var substr3 = str[range] // 123

// 子串获取父串: 获取的是副本不是指向原串的指针
var superStr = substr1.base
superStr.removeFirst(4)
print(superStr) // 56
print(str) // 123456

/*
 ##### String 与 Character
 */

// c是Character类型
for c in str {
    print(c)
}
// c是Character类型
var c = str[str.startIndex]

/*
##### String相关协议
 - BidirectionalCollection协议
 Bidirectional：双向的
 其中的定义的方法有：
     - startIndex、endIndex属性，index方法
     - String、Array都遵守了这个协议
 - RangeReplaceableCollection协议
    - 定义了append、insert、remove等方法
    - String、Array都遵守了这个协议
 - Dictionary、Set也有实现上述协议中的声明的一些方法，只是并没有遵守上述协议
*/

/*
##### 多行String
 - 多行字符串内支持`'`、`"`、`""`、
 - 当现实`"""`时，只需要转义其中一个`"`，比如`""\"`
 - 每一行的字符串的开头不能超过尾部的`"""`，因为它是字符串的最前面
*/

var lines = """
1
    ""2"
 ""\"3
    '4'
""" // 字符串的竖直位置 不成超出第一个引号


print(lines)

/*
 ##### String与NSString
 - String也NSString之间可以随时随地的桥接转换(会消耗点性能，不是免费转换的)
 - String不能转成NSMutableString
 - NSMutableString可以转成String，因为NSMutableString也是NSString
 - 比价字符串内容是否相等
    - String使用 == 运算符
    - NSString适应 isEqual方法，也可以使用 == 运算符(底层仍然是调用了isEqual方法)
 */

do {
    var str1: String = "tom"
    var str2: NSString = "jerry"
    
    var str3 = str1 as NSString // 副本
    var str4 = str2 as String // 副本
     
    str4.append("biu") // 不影响str2
    
//    var str5 = str1 as NSMutableString // 报错，不能转成NSMutableString
    
    // NSMutableString可以转成String，因为NSMutableString也是NSString
    var str6: NSMutableString = "jim"
    var str7 = str6 as String
}

/*
 ##### Swift、OC桥接转换表
 - NSString、NSArra、NSDictionary、NSSet可以互转
 - 可变形式可以转成Swift版，但swift版不能转成OC的可变形式
 */

/*
##### 在Swift中的类继承NSObject，会导致实例对象的内存布局的变化
 - Swift类实例的第一个8字节存放metadata，第二个字节存放引用计数相关
 - 继承自NSObject，第一个8字节存放isa指针
*/
