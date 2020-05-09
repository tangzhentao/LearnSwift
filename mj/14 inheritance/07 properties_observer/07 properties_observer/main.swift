//
//  main.swift
//  07 properties_observer
//
//  Created by void on 2020/5/9.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 子类为父类属性添加属性观察器
 */

// 子类为父类的实例存储属性、实例计算属性，添加属性观察器
func testNomal() -> Void {
    class Circle {
        var radius = 0.0 {
            willSet {
                print("Circle will set radius")
            }
            didSet {
                print("Circle did set radius")
            }
        }

        var diameter: Double {
            get {
                print("Circle diameter")
                return radius * 2
            }
            set {
                print("Circle set diameter")
                radius = newValue / 2
            }
        }
    }

    class SubCircle: Circle {
        override var radius: Double {
            willSet {
                print("SubCircle will set radius")
            }
            didSet {
                print("SubCircle did set radius")
            }
        }

        override var diameter: Double {
            willSet {
                print("SubCircle will set diameter")
            }
            didSet {
                print("SubCircle did set diameter")
            }
        }
    }

    let s = SubCircle()
    s.diameter = 2
}
testNomal()

func getAnimalName() -> String {
    return "dog"
}
func getDogName() -> String {
    return "er ha"
}

// 子类为父类的类型存储属性、类型计算属性，添加属性观察器
func testTypeProperties() -> Void {
    class Circle {
        class var radius: Int {
            get {
                return 1
            }
            
            set {
                print("set:", newValue)
            }
        }
    }
    
    // 以下代码，编译器在编译时出现异常，已经反馈给Apple
    class SubCircle: Circle {
        override class var radius: Int {
            willSet {
                
            }
            didSet {
                
            }
        }
    }
    
}
testTypeProperties()

