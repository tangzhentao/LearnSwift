//
//  main.swift
//  10 class.self_class.Type_AnyClass
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("Hello, World!")

class Person {}
class Student: Person {}

var personMetadata: Person.Type = Person.self
var studentMetadata: Student.Type = Student.self
personMetadata = Student.self

var anyClassType: AnyObject.Type = Person.self
anyClassType = AnyObject.self

var person = Person()
personMetadata = type(of: person)
print(personMetadata == Person.self)


print("----- 元类型的应用 -----")
/* 元类型的应用 */
class Animal {
    required init () {
        print("animal init")
    }
}
class Cat: Animal {
    required init () {
        print("Cat init")
    }
}
class Dog: Animal {
    required init () {
        print("Dog init")
    }
}

@discardableResult  func create(array: [Animal.Type]) -> [Animal] {
    
    var objArray = [Animal]()
    for item in array {
        objArray.append(item.init())
    }
    return objArray
}

var array = [Animal.Type]()
array.append(Cat.self)
array.append(Dog.self)
create(array: array)

print("------ 父类 ------")
var metadata = class_getSuperclass(Dog.self)
print(metadata!)
metadata = class_getSuperclass(metadata)
print(metadata!)
