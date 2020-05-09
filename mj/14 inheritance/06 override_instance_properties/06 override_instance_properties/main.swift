//
//  main.swift
//  06 override_instance_properties
//
//  Created by void on 2020/5/9.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 重写类类型计算属性为类型计算属性
 */

func getAnimalName() -> String {
    return "dog"
}

class Animal {
    class var name: String {
        get {
            return getAnimalName()
        }
        
    }
}


func getDogName() -> String {
    return "er ha"
}

class Dog: Animal {
    class override var name: String {
        get {
            let name1 = super.name
            let name2 = getDogName()
            
            return name1 + " " + name2
        }
        
        set {
            print("do nothing, too")
        }
    }
}
print("name:", Animal.name)
print("name:", Dog.name)

