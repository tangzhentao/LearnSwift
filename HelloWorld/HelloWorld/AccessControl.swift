//
//  AccessControl.swift
//  HelloWorld
//
//  Created by itang on 2019/9/28.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

public class SomePublicClass { // 显示 public 类
    public var somePublicProperty = 0 // 显示 public 属性
    var someInternalProperty = 0 // 隐式 internal 属性
    fileprivate func someFilePrivateMethod () {} // 显示 fileprivate 方法
    private func somePrivateMethod () {} // 显示private 方法
}

class SomeInternalClass {
    var someInternalProperty = 0
    fileprivate func someFilePrivateMethod () {}
    private func somePrivateMethod () {}
}

fileprivate class SomeFilePrivateClass {
    func someFilePrivateMethod() {} // 隐式 fileprivate 方法
    private func somePrivateMethod () {}
}


private class SomePrivateClass { // 显示 private 类
    func somePrivateMethod() { } // 隐式 private 方法
    
    public class SomeNestedPublicClass {
        func printHello() {
            print("hello")
        }
    }
}

private func someFunction () -> (SomeFilePrivateClass, SomePrivateClass) {
    return (SomeFilePrivateClass(), SomePrivateClass())
}
