//
//  main.swift
//  09 Autoclosures
//
//  Created by void on 2020/4/29.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 如果第一个参数大于0，则返回第一个参数，否则返回第二个参数
 */
func getNum () -> Int {
    print("做了很多事")
    return 68
}

func selectNum1(v1: Int, v2: Int) -> Int {
    return v1 > 0 ? v1 : v2
}

print(selectNum1(v1: 1, v2: getNum() ) )
print(selectNum1(v1: -1, v2: getNum() ) )

print("\n-------------\n")

func selectNum2(v1: Int, v2: ()->Int) -> Int {
    return v1 > 0 ? v1 : v2()
}


var num = selectNum2(v1: 1, v2: getNum)
print( selectNum2(v1: 1, v2: getNum) )
print( selectNum2(v1: -1, v2: getNum) )

print("\n-------------\n")

func selectNum3(v1: Int, v2: @autoclosure ()->Int) -> Int {
    return v1 > 0 ? v1 : v2()
}

print(selectNum3(v1: 1, v2: getNum() ) )
print(selectNum3(v1: -1, v2: getNum() ) )


// ?? 使用了自动闭包
var i: Int? = 1

// 重载 selectNum2
func selectNum2(v1: Int, v2: @autoclosure ()->Int) -> Int {
    return v1 > 0 ? v1 : v2()
}
