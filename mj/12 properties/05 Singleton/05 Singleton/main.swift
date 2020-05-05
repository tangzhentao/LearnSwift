//
//  main.swift
//  05 Singleton
//
//  Created by void on 2020/5/5.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("利用存储类型属性，实现单例")

class FileManager {
    static let sharedInstance = FileManager()
    
    
    private init() {
        print("private init")
    }
    
    func open() -> Void {
        print("open file success")
    }
    func close() -> Void {
        print("close file success")
    }
}

let fm1 = FileManager.sharedInstance
fm1.open()
fm1.close()
let fm2 = FileManager.sharedInstance
fm2.open()
fm2.close()

