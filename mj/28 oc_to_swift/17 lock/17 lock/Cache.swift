//
//  Cache.swift
//  17 lock
//
//  Created by void on 2020/5/29.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

struct Cache {
    private var data = [Any]()
//    private static var lock = DispatchSemaphore(value: 1) // 1代表同时只能有一个线程访问
//    private static var lock = NSLock()
    private static var lock = NSRecursiveLock()


    
    mutating func store(_ value: Any) {
        
        // 信号量的写法
//        Self.lock.wait()
//        data.append(value)
//        Self.lock.signal()
        
        Self.lock.lock()
        defer {
            Self.lock.unlock()
        }
        data.append(value)

    }
    
    func get(_ index: Int) -> Any? {
        return data[index]
    }
    
    func show() {
        print("data:", data)
    }
}
