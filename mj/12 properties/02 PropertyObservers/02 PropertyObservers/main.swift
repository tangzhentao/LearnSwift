//
//  main.swift
//  02 PropertyObservers
//
//  Created by void on 2020/4/30.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 给存储属性添加属性观察器
 */
struct Size {
    var width: Double {
        willSet {
            print("will set width:", newValue)
        }
        didSet {
            print("did set width: \(oldValue) ->", width)
        }
    }
    
    var height: Double = 1.0 { // 给添加属性观察器的属性设置默认值
        willSet (newHeight) { // 使用自定义参数名
            print("will set height:", newHeight)
        }
        didSet (oldHeight) {
            print("did set height: \(oldHeight) -> \(height)")
        }
    }
    
    init() {
        self.width = 1.0
        print("Size init")
    }
}

var s = Size()
s.height = 2
s.width = 3

/*
 全局变量、局部变量也可以使用属性观察器和计算属性
 */
print("\n---- 全局变量、局部变量 属性观察器、计算属性 ---\n")
var globalNum = 1 {
    willSet {
        print("will set globalNum:", newValue)
    }
    didSet {
        print("did set globalNum: \(oldValue) -> \(globalNum)")

    }
}
print("---- 全局变量属性观察器 ---")

print("globalNum:", globalNum)
globalNum = 2

func testLocalVar () {
    var localNum = 3 {
        willSet {
            print("will set localNum:", newValue)
        }
        didSet {
            print("did set localNum: \(oldValue) -> \(localNum)")

        }
    }
    print("localNum:", localNum)
    localNum = 4
}
print("---- 局部变量属性观察器 ---")
testLocalVar ()

print("---- 全局计算变量 ---")
var globalComputedNum: Int {
    get {
        return globalNum * 2
    }
    set {
        globalNum = newValue / 2
    }
}
print("globalNum:", globalNum)
print("globalComputedNum:", globalComputedNum)
globalComputedNum = 10
print("globalNum:", globalNum)

print("---- 局部计算变量 ---")

func testLoalComputedVar(x: Int) -> Void {
    
    var localX = x
    var localComputedNum: Int {
        get {
            return 2 * localX
        }
        set {
            localX = newValue / 2
        }
    }
    
    print("localX:", localX)
    print("localComputedNum:", localComputedNum)
    localComputedNum = 10
    print("localX:", localX)
}
testLoalComputedVar(x: 4)
