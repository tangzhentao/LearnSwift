//
//  main.m
//  sizeof_assembly
//
//  Created by itang on 2020/2/6.
//  Copyright © 2020 learn. All rights reserved.
//

/*
 目标：
    通过汇编查看sizeof()是不是函数调用
 
 结论：
    看汇编代码没有发现call指令，
    有
    movl   $0x4, -0x14(%rbp)；
    sizeof()不是函数调用
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    int i = sizeof(int);
    return 0;
}
