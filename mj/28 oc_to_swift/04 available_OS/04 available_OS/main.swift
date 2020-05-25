//
//  main.swift
//  04 available_OS
//
//  Created by void on 2020/5/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 系统版本检测
 iOS/macOS/iOSApplicationExtension/macOSApplicationExtension/watchOS/tvOS
 - 系统后面必须跟版本号
 - *是必须的，为了将来的平台可以用
 */

if #available(iOS 10, macOS 10.12, *) {
    /*
     对于iOS平台，只在iOS10及以上版本执行
     对于macOS苹果，只在macOS 10.12及以上版本执行
     最后的*表示，在其他所有平台都可以执行
     */
}

let available: String

// 系统后面必须跟版本号
if #available(iOS 10, macOS 10.15.4, iOSApplicationExtension 2, macOSApplicationExtension 2, *) {
    /*
     对于iOS平台，只在iOS10及以上版本执行
     对于macOS苹果，只在macOS 10.12及以上版本执行
     最后的*表示，在其他所有平台都可以执行
     */
    available = "当前是可用的"
} else {
    available = "当前是不可用的"
}
print(available)

