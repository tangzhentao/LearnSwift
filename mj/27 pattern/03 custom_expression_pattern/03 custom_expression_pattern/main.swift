//
//  main.swift
//  03 custom_expression_pattern
//
//  Created by void on 2020/5/24.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 更复杂的自定义表达式模式
 */

extension String {
    
    /*
     pattern 是case后面的内容
     value 是switch后面的内容
     */
    static func ~= (pattern: (String) -> Bool, value: String) -> Bool {
        pattern(value)
    }
}

func hasPrefix(_ str: String) -> (String) -> Bool {
    return {
            (value: String) -> Bool in
            value.hasPrefix(str)
        }
}

var name = "jack"
switch name {
case hasPrefix("j"):
    print("以j开头")
default:
    break
}

