//
//  BasicOperators.swift
//  HelloWorld
//
//  Created by itang on 2019/7/30.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class BasicOperators {
    
    func learnAssignmentOperator() -> Void {
        // 与C和Objective-C不同，Swift的赋值操作并不返回任何值
        
        /*
         所以下面的连续赋值会报错
         var a: Int = 1
         var b: Int = 2
         var c: Int = 3
         c = b = a
         */
        
        /*
         所以把 == 误写为 = 时也会报错
         var i = 1
         if i = 2 {
         //
         }
         */
        
    }
    
    func learn() {
        self.learnAssignmentOperator()
    }
}
