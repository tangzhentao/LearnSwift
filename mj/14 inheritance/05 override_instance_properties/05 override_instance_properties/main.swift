//
//  main.swift
//  05 override_instance_properties
//
//  Created by void on 2020/5/9.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 重写父类实例属性
 重写类下标
 */

func testNomal() -> Void {
    class Circle {
        var radius = 0.0
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
            get {
                print("SubCircle radius")
                return super.radius > 0 ? super.radius : 0
            }
            set {
                print("SubCircle set radius")
                if newValue > 0 {
                    super.radius = newValue
                } else {
                    super.radius = 0
                }
            }
        }
        
        override var diameter: Double {
            get {
                print("SubCircle diameter")
                return super.diameter
            }
            set {
                print("SubCircle set diameter")
                if newValue > 0 {
                    super.diameter = newValue
                } else {
                    super.diameter = 0
                }
            }
        }
    }
    
    let c = Circle()
    c.diameter = -1
    print("c diameter:", c.diameter)
    
    print("----------------")

    let s = SubCircle()
    s.diameter = -1
    print("-------")
    print("s diameter:", s.diameter)

}

testNomal()


