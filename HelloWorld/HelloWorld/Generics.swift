//
//  Generics.swift
//  HelloWorld
//
//  Created by tang on 2019/9/19.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

// 关联类型
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int {get}
    subscript (index: Int) -> Item {get}
}

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
    struct IntStack: Container {
        var items = [Int]()
        
        mutating func push(_ item: Int) {
            items.append(item)
        }
        
        mutating func pop() -> Int{
            let removedItem = items.removeLast()
            return removedItem
        }
        
        // 协议Container的方法
        typealias Item = Int
        mutating func append(_ item: Int) {
            items.append(item)
        }
        
        var count: Int {
            return items.count
        }
        
        subscript (index: Int) -> Int {
            return items[index]
        }
    }
    
    // 泛型栈
    struct Stack<Element>: Container {
        var items = [Element]()
        
        mutating func push(_ item: Element) {
            items.append(item)
        }
        
        mutating func pop () -> Element {
            let removedItem = items.removeLast()
            return removedItem
        }
        
        // Container协议的方法
        typealias Item = Element
        mutating func append(_ item: Element) {
            items.append(item)
        }
        
        var count: Int {
            return items.count
        }
        
        subscript (index: Int) -> Element {
            return items[index]
        }
    }
    
    /* 约束泛型类型 */
    
    // 非泛型
    func findIndex(ofString valueToFind: String, in array: [String]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        
        return nil
    }
    // 泛型
    func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
        for (index, value) in array.enumerated() {
            if value == valueToFind {
                return index
            }
        }
        
        return nil
    }
    
    
    // 对关联类型进行约束
    
    
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
        
        // 使用Stack结构体的扩展方法
        if let item = stack.topItem {
            print("top itme:", item)
        }
        
        // 使用非泛型的查处方法
        let strings = ["hello", "world", "jobs", "lebron"]
        var string = "lebron"
        if let index = findIndex(ofString: string, in: strings) {
            print("the index of", string, "is", index)
        }
        
        string = "kobe"
        if let index = findIndex(ofString: string, in: strings) {
            print("the index of", string, "is", index)
        } else {
            print("there is no string:", string)
        }
        
        string = "hello"
        if let index = findIndex(of: string, in: strings) {
            print("the index of", string, "is", index)
        }
        
        numbers = [1, 2, 3, 4, 5]
        let numToFind = 2
        if let index = findIndex(of: numToFind, in: numbers) {
            print("the index of", numToFind, "is", index)
        }
        
        var numStack = Stack<Int>()
        numStack.append(1)
        numStack.append(2)
        numStack.append(3)
        numStack.append(4)

        
        let suffix = numStack.suffix(3)
        print("suffix:", suffix)

    }
}

// 在协议中对关联类型进行约束
protocol SuffixableContainer: Container {
    associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
    func suffix(_ size: Int) -> Suffix
}

extension Generics.Stack: SuffixableContainer {
    func suffix(_ size: Int) -> Generics.Stack<Element> {
        var stack = Generics.Stack<Element>()
        
        let begin = count - size
        let end = count - 1
        
        for index in begin...end {
            stack.append(items[index])
        }
        
        return stack;
    }
}

// 在泛型函数中对关联类型进行约束
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for index in 0..<someContainer.count {
        if someContainer[index] !=  anotherContainer[index]  {
            return false
        }
    }
    
    return true
}

// 具有泛型where子句的扩展
extension Generics.Stack where Element: Equatable {
    func isTop(item: Element) -> Bool {
        
        guard let topItem = items.last else {
            return false
        }
        
        return topItem == item
    }
}
