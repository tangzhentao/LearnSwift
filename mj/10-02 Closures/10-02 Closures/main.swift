//
//  main.swift
//  10-02 Closures
//
//  Created by void on 2020/4/26.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

func getFn() -> (Int) -> Int {
    var num = 6

    func add(a: Int) -> Int {
        num += a
        return num
    }

    return add
}

var addFn = getFn()
//print("addFn size:", MemoryLayout.stride(ofValue: addFn))

//func plus(a: Int) -> Int {
//    return a + 1
//}
//
//// 函数变量占16个字节
//let plusFn = plus
//print("plusFn size:", MemoryLayout.stride(ofValue: plusFn)) // 16
//plusFn(1)
let reuslt = 1



/*
 0x100000ef0 <+0>:  pushq  %rbp
     0x100000ef1 <+1>:  movq   %rsp, %rbp
     0x100000ef4 <+4>:  movq   $0x0, -0x8(%rbp)
 ->  0x100000efc <+12>: leaq   0xd(%rip), %rax           ; add #1 (a: Swift.Int) -> Swift.Int in _0_02_Closures.getFn() -> (Swift.Int) -> Swift.Int at main.swift:16
     0x100000f03 <+19>: xorl   %ecx, %ecx
     0x100000f05 <+21>: movl   %ecx, %edx
     0x100000f07 <+23>: popq   %rbp
     0x100000f08 <+24>: retq
 
 
 */


