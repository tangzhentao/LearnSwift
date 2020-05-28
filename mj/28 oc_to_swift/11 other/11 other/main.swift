//
//  main.swift
//  11 other
//
//  Created by void on 2020/5/28.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 定义只能被class遵守的协议
 - AnyObject
 - AnyObject
 - @objc
 */

protocol P1: AnyObject { }

protocol P2: class { }

@objc
protocol P3: class { }


//struct Cat1: P1 { // Non-class type 'Cat1' cannot conform to class protocol 'P1'
//
//}

//struct Cat1: P2 { // Non-class type 'Cat1' cannot conform to class protocol 'P2'
//
//}

//struct Cat1: P3 { // Non-class type 'Cat1' cannot conform to class protocol 'P3'
//
//}

/*
 ##### 定义类协议的可选方法
 - 用`@objc`修饰协议
 - 用`@objc optional`修饰方法
 */

@objc
protocol P4 {
    @objc optional func test ()
}

class Cat: P4 {
    // 不用实现P4中的可选方法
}

/*
##### dynamic
- 用`@objc dynamic`修饰的内容具有动态性，如果调用方法会走runtime消息机制那一套；
*/

class Dog {
    @objc dynamic func test1 () {
        
    }
    
    func test2 () {
        
    }
}

let dog = Dog()

dog.test1() // 走runtime 消息机制
dog.test2() // 走虚表调用

let i = 1

/*
##### KVO/KVC
 Swift支持KVO/KVC的条件是：
 - 属性所在的类和监听器最终继承自NSObjct
- 用`@objc dynamic`修饰的对应的属性
*/
class Person: NSObject {
    @objc dynamic var age = 0
    
    deinit {
        print(type(of: self), #function)
    }
}

class Observer: NSObject {
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if let key = keyPath {
            print(key, change?[.newKey] as Any, change?[.oldKey] as Any)
        }
    }
    
    deinit {
        print(type(of: self), #function)
    }
}

do {
    var jim = Person()
    jim.age = 10
    let ob = Observer()
    jim.addObserver(ob, forKeyPath: "age", options: [.new, .old], context: nil)
    jim.age = 20
}


