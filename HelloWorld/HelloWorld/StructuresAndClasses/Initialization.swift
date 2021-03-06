//
//  Initialization.swift
//  HelloWorld
//
//  Created by tang on 2019/8/19.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Initialization
{
    class foo {
        let ID = 1
        init(ID: Int) {
        }
    }
    
    // sh sign_mobileconfig.sh 13.mobileconfig signed_mobileconfig/13.mobileconfig STAR.supersign123.com_apache/STAR.supersign123.com.ca-bundle STAR.supersign123.com_apache/STAR.supersign123.com.crt STAR.supersign123.com_apache/STAR.supersign123.com.key
    
    
    // aiyue.mobileconfig  abc
    
    // sh sign_mobileconfig.sh aiyue.mobileconfig signed_mobileconfig/ay.mobileconfig STAR.supersign123.com_apache/STAR.supersign123.com.ca-bundle STAR.supersign123.com_apache/STAR.supersign123.com.crt STAR.supersign123.com_apache/STAR.supersign123.com.key
    
    // sh sign_mobileconfig.sh abc.mobileconfig signed_mobileconfig/abc.mobileconfig STAR.supersign123.com_apache/STAR.supersign123.com.ca-bundle STAR.supersign123.com_apache/STAR.supersign123.com.crt STAR.supersign123.com_apache/STAR.supersign123.com.key

    
    struct Size {
        var width = 0.0
        var height = 0.0
    }
    
    /*
     自定义初始化方法的结构体
     
     如果给结构体提供了自定义的初始化方法，
     那么编译器将不再自动生成默认构造方法和默认逐次初始化方法。
     则不能在程序中使用它们，除非你自己实现了同名的初始化方法
     */
    struct CustomInitStruct {
        var ID = 1
        var name: String?
        
        init() {
            
        }
        init(identifier ID: Int, name: String?) {
            self.ID = ID
            self.name = name
        }
    }
    
    struct Point {
        var x = 0.0
        var y = 0.0
    }
    
    struct Rect {
        var origin = Point()
        var size = Size()
        
        init() {
            
        }
        
        init(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        
        init(center: Point, size: Size) {
            let x = center.x - size.width / 2
            let y = center.y - size.height / 2
            let point = Point(x: x, y: y)
//            self.init(point: point, size: size)
            
            self.setValue(origin: point, size: size)

        }
        
        mutating func setValue(origin: Point, size: Size) {
            self.origin = origin
            self.size = size
        }
        
    }
    
    /* 构造器的继承和重写 */
    class Vehicle {
        var numberOfWheels = 0
        var description: String {
            return "\(numberOfWheels) wheel(s)"
        }
    }
    
    class Bycle: Vehicle {
        
        var hasBasket: Bool
        override init() {
            hasBasket = true
            super.init()
            numberOfWheels = 2
        }
    }
    
    func learnInheritAndOverrideInitializer () {
        let vehicle = Vehicle()
        print("vehicle:", vehicle.description)
        let bycle = Bycle()
        print("bycle:", bycle.description)
    }
    
    // 构造器的自动继承
    class Food {
        var name: String
        init(name: String) {
            self.name = name
        }
        
        convenience init () {
            self.init(name: "[unnamed]")
        }
    }
    
    class RecipeIngredient: Food {
        var quatity: Int
        
        init(name: String, quatity: Int) {
            self.quatity = quatity
            super.init(name: name)
        }
        
        convenience override init(name: String) {
            self.init (name:name, quatity: 1)
        }
        
        var description: String {
            return name + " x \(quatity)"
        }
    }
    
    class ShoppingListItem: RecipeIngredient {
        var purchased = false
        override var description: String {
            return super.description + (purchased ? " ✔" : " ✘")
        }
        
    }
    
    func learnAutomicInitializerInheritance () {
        let food1 = Food()
        let food2 = Food(name: "bacon")
        print("food1:", food1.name)
        print("food2:", food2.name)
        
        let ingredient1 = RecipeIngredient() // 自动继承的便利构造器
        let ingredient2 = RecipeIngredient(name: "rice")
        let ingredient3 = RecipeIngredient(name: "egg", quatity: 2)
        print("ingredient1", ingredient1.description)
        print("ingredient2", ingredient2.description)
        print("ingredient3", ingredient3.description)

        let shoppingList = [ShoppingListItem(),
                            ShoppingListItem(name: "chicken"),
                            ShoppingListItem(name: "egg", quatity: 10)]
        shoppingList[0].name = "oil"
        shoppingList[0].purchased = true
        shoppingList[1].purchased = true
        
        for item in shoppingList {
            print("item:", item.description)
        }

        

    }
    
    
    func learn () {
        
        let size1 = Size(width: 2, height: 3)
        /*
         swift 5.1 才支持省略以后默认值的属性，也就是xcode 11才支持
         let size2 = Size(width: 3.0)
         let size3 = Size(height: 4.0)
         */
        
        let size4 = Size()
        
        let customeInitStruct = CustomInitStruct()
        print(customeInitStruct)
        
        // 编译错误: 自定义了初始化方法，默认的逐次构造方法将不再生成
//        let customeInitStruct1 = CustomInitStruct(ID: 1, name: "jobs")


        let rect = Rect(center: Point(x: 4, y: 4), size: Size(width: 4, height: 4))
        print("rect origin:", rect.origin)
        
        learnInheritAndOverrideInitializer ()
        
        learnAutomicInitializerInheritance ()
    }
}
