//
//  main.swift
//  05 api_available
//
//  Created by void on 2020/5/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 API可用性说明
 将 available 特性用于声明时，表示该声明的生命周期是相对于特定的平台和操作系统版本。
 available 参数之间由逗号分隔。这些参数由以下这些平台名字中的一个起头：
 iOS
 iOSApplicationExtension
 macOS
 macOSApplicationExtension
 watchOS
 watchOSApplicationExtension
 tvOS
 tvOSApplicationExtension
 swift
 
 更多参考
 https://docs.swift.org/swift-book/ReferenceManual/Attributes.html
 */

@available(iOS 10, macOS 10.15.4, *)
class Cat {
    
}

struct Student {
    
    @available(*, unavailable, renamed: "study")
    func study_() {
        
    }
    func study() {
        
    }

    @available(macOS, deprecated: 10.15)
    func run()  {
    }
    
    @available(macOS, obsoleted: 10.15, message: "use run")
    func breath() {
        
    }
    
    @available(swift 6)
    func eat() {
        
    }
}

let jim = Student()
//jim.study_()
let cat = Cat()
jim.run()
jim.breath()
jim.eat()
