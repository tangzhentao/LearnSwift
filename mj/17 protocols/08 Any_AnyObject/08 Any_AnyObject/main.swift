//
//  main.swift
//  08 Any_AnyObject
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol ClassPotocol: AnyObject {
    
}

enum Gender {
    case male
    case femal
}

struct Cat {
    var age = 0
}

class Dog: ClassPotocol {
    var name = "er ha"
}

var array: [Any] = []
array.append(Gender.femal)
array.append(Cat())
array.append(Dog())
array.append({print("hello")})


