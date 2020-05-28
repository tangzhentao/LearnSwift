//
//  main.swift
//  12 associated_object
//
//  Created by void on 2020/5/28.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 #### 关联对象
 - 关联对象，只能添加到类身上
 - 在Swift中，class依然可以使用关联对象
 - 在Swift中，extension不可以增加存储属性
 在OC中如果扩展和类在同一个源文件中，可以添加存储属性
 - 借助关联对象，可以实现类似extension为class增加存储属性
 */

class Cat {
    var age = 0
}

extension Cat {
    
    private static var NameKey = true // 占用一个字节
    var name: String {
        get {
            // objc_getAssociatedObject返回的是Any?，先转为String，得到的是可选字符串类型，然后再解包成字符串
            return (objc_getAssociatedObject(self, &Self.NameKey) as? String) ?? ""
        }
        set {
            objc_setAssociatedObject(self, &Self.NameKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    private static var IdKey: Void? // 占用一个字节
    var id: Int {
        get {
            // objc_getAssociatedObject返回的是Any?，先转为String，得到的是可选字符串类型，然后再解包成字符串
            return (objc_getAssociatedObject(self, &Self.IdKey) as? Int) ?? 0
        }
        set {
            objc_setAssociatedObject(self, &Self.IdKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
}

var tom = Cat()
tom.age = 2
tom.id = 3
tom.name = "tom"
print(tom.id, tom.age, tom.name) // 3 2 tom
