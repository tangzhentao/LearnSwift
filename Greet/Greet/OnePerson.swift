//
//  Person.swift
//  Greet
//
//  Created by itang on 2019/10/3.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

/// 一中性格的人
public class OnePerson {
    
    /// 指定初始化器
    public init () {}
    
    /// 打招呼
    public func greet (someone: String? = nil) {
        var who = "everyone"
        if let w = someone {
            who = w
        }
        
        print("Hello,", who)
    }
    
    /// 说话
    public func say() {
        greet()
    }
}
