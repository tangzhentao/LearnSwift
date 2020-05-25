//
//  main.swift
//  02 conditional_compilation
//
//  Created by void on 2020/5/25.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation


/*
 参考链接
 https://docs.swift.org/swift-book/ReferenceManual/Statements.html#grammar_environment
 */

let platform: String
/*
 ##### 条件编译不同的操作系统
 - macOS, iOS, watchOS, tvOS, Linux
 后续可以支持Android、Windows、FreeBSD
 */
#if os(macOS) || os(iOS)
#elseif os(tvOS) || os(watchOS)
#elseif os(Android)
#endif
/*
 ##### 条件编译CPU架构
 - i386\x86_64\arm\arm64
 */
#if arch(i386)
#elseif arch(x86_64)
#endif

/*
 ##### 条件编译Swift版本
 - 只支持<、>=操作
 */
#if swift(<5)
#elseif swift(>=5)
#endif
/*
 ##### 条件编译真机、摸机器
 - targetEnvironment(simulator)
 是不是模拟器
 - simulator
 - targetEnvironment(macCatalyst)
 Mac Catalyst 是苹果在今年WWDC上发布的一个帮助开发者将iPad 应用移植到macOS上的服务。
 */
#if targetEnvironment(simulator)
platform = "是模拟器"
#else
platform = "不是模拟器"
#endif

print(platform)

/*
 ##### 条件编译是否可以导入某个模块
 - canImport()
 */

let can: String
#if canImport(Foundation)
can = "能导入Fundation"
#else
can = "不能导入Fundation"
#endif
print(can)
/*
##### 条件编译编译器版本
- compiler()
- 查看编译器版本
 swift --version
*/
#if compiler(>=5)
#endif

#if compiler(>=5) && swift(>=5)
#endif

/*
 ##### 添加条件编译标志
 Targets -> Build Settings -> Swift Compiler - Custom Flags
 */
let debug: String
#if DEBUG
debug = "debug"
#else
debug = "release"
#endif
print(debug)

let name: String
#if HuanLeChat
name = "HuanLeChat"
#else
name = "qita"
#endif
print(name)
