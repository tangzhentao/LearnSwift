//
//  Generics.swift
//  HelloWorld
//
//  Created by tang on 2019/9/19.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Generics
{
    func swapTowInt(_ a: inout Int, _ b: inout  Int) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    func swapTwoString(_ a: inout String, _ b: inout String) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    // 泛型函数
    func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
    
    struct TestStruct {
        var value: Int = 0
    }
    
    /* 泛型类型 */
    
    // 普通栈
    struct IntStack {
        var items = [Int]()
        
        mutating func push(_ item: Int) {
            items.append(item)
        }
        
        mutating func pop() -> Int{
            let removedItem = items.removeLast()
            return removedItem
        }
    }
    
    // 泛型栈
    struct Stack<Element> {
        var items = [Element]()
        
        mutating func push(_ item: Element) {
            items.append(item)
        }
        
        mutating func pop () -> Element {
            let removedItem = items.removeLast()
            return removedItem
        }
    }
    
    func learn() {
        var a = 1
        var b = 2
        print("a:", a, "b:", b)
        swapTowInt(&a, &b)
        print("a:", a, "b:", b)
        
        var s1 = "hello", s2 = "world"
        print("s1:", s1, "s2:", s2)
        swapTwoString(&s1, &s2)
        print("s1:", s1, "s2:", s2)
        
        swapTwoValues(&a, &b)
        print("a:", a, "b:", b)
        swapTwoValues(&s1, &s2)
        print("s1:", s1, "s2:", s2)
        
        var t1 = TestStruct(value: 3), t2 = TestStruct(value: 4)
        swapTwoValues(&t1, &t2)
        
        var numbers = [1, 2]
        numbers.append(3)
        
        var intStack = IntStack()
        intStack.push(1)
        print(intStack)
        intStack.push(2)
        print(intStack)
        intStack.push(3)
        print(intStack)
        
        var removedItem =  intStack.pop()
        print("removed item:", removedItem, intStack)
        removedItem =  intStack.pop()
        print("removed item:", removedItem, intStack)
        removedItem =  intStack.pop()
        print("removed item:", removedItem, intStack)
        
        var stack = Stack<String>()
        stack.push("a")
        print(stack)
        stack.push("b")
        print(stack)
        stack.push("c")
        print(stack)
        
        var removedString =  stack.pop()
        print("removed item:", removedString, stack)
        removedString =  stack.pop()
        print("removed item:", removedString, stack)

    }
}
