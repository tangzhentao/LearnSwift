//
//  main.swift
//  03 inout本质
//
//  Created by void on 2020/4/30.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 参数修饰符 inout 的本质
 */


//var i = 1
func add(x: inout Int) {
    x = x + 3
}
//add(x: &i)


struct Shape {
    var sideLenght: Int
    var count: Int {
        willSet {
            print("will set count:", count)
        }
        didSet {
            print("did set count: \(oldValue) -> \(count)")
        }
    }
    var girth: Int {
        get {
            count * sideLenght
        }
        set {
            sideLenght = newValue / count
        }
    }
    
    func show() -> Void {
        print("Shape: \(count) sides, side length \(sideLenght)")
    }
}

var shape = Shape(sideLenght: 6, count: 3)
//shape.show()

//print("\nadd sideLenght")
//add(x: &shape.sideLenght)
//shape.show()

//print("\nadd girth")
//add(x: &shape.girth)
//shape.show()

//print("\nadd count")
add(x: &shape.count)
//shape.show()
