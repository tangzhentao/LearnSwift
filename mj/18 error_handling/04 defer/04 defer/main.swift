//
//  main.swift
//  04 defer
//
//  Created by void on 2020/5/14.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

enum CalculateError: Error {
    case zero(String)
    case overfloat
}

func divide(x: Int, y: Int) throws -> Int {
    if y == 0 {
        throw CalculateError.zero("divide 0")
    }
    return x/y
}

func openFile(file: String) -> Int {
    print("打开文件")

    // 打开文件，返回文件句柄id
    return 1
}

func handleFile() throws {
    let fileId = openFile(file: "readme")
    defer {
        closeFile(fileId: fileId)
    }
    print("c处理文件 - 开始")
    
    try divide(x: 4, y: 0)
    
    print("c处理文件 - 结束")
}

func closeFile(fileId: Int) {
    print("关闭文件")
}

try handleFile()

