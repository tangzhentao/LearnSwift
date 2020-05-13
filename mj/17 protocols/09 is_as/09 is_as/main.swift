//
//  main.swift
//  09 is_as
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

protocol ClassPotocol: AnyObject {
    func show()
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
    func show() {
        print("I am er ha")
    }
}

class Ant: ClassPotocol {
    var name = "xiao"
    func show() {
        print("I am ant")
    }
}

var array: [Any] = []
array.append(Gender.femal)
array.append(Cat())
array.append(Dog())
array.append({print("hello")})
array.append(Ant())

for item in array {
    if item is Gender {
        print(item, " is Gender")
    } else if item is Cat {
        print(item, " is Cat")
    } else if item is Dog {
        print(item, " is Dog")
    } else if item is ClassPotocol {
        print(item, " is ClassPotocol")
    } else  if item is ()->() {
        print(item, "is ()->()")
    }
}

print("----- as -----")
var erha = Dog()
var cat = Cat()
var ant = Ant()
var animals = [Any]()
animals.append(erha)
animals.append(cat)
animals.append(ant)

for item in animals {
    (item as? Dog)?.show()
    (item as? ClassPotocol)?.show()
}
