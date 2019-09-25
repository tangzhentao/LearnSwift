//
//  ARC.swift
//  HelloWorld
//
//  Created by tang on 2019/9/25.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class ARC {
    
    class Person {
        var name: String
        init(name: String) {
            self.name = name
            print(name, "is being initialized")
        }
        
        var apartment: Apartment?
        
        
        deinit {
            print(name, "is being deinitialized")
        }
    }
    
    class Apartment {
        var unit: String
        init(unit: String) {
            self.unit = unit
            print("aepartment \(unit) is being initialized")
        }
        
        weak var tenant: Person?
        
        deinit {
            print("apartment \(unit) is being deinitialized")
        }
    }
    
    func localObject() {
        print("localObject begin")
        let person = Person(name: "kobe") // 局部变量在执行到函数作用域末尾是会被释放
        print("localObject end")
    }
    
    /* unowned 引用 */
    class Customer {
        var name: String
        init(name: String) {
            self.name = name
            
            print("customer \(name) is being initialized")
        }
        
        var creditCart: CreditCard?
        
        deinit {
            print("customer \(name) is being deinitialized")
        }
    }
    
    class CreditCard {
        var ID: String
        unowned var owner: Customer
        init(ID: String, owner: Customer) {
            self.ID = ID
            self.owner = owner
            
            print("credit card \(ID) is being initialized")
        }
        
        deinit {
            print("credit card \(ID) is being deinitialized")
        }
    }
    
    func learnUnownedReference() {
        var james: Customer?
        var creditCard: CreditCard?
        
        james = Customer(name: "james")
        creditCard = CreditCard(ID: "001", owner: james!)
        
        james?.creditCart = creditCard
        james = nil
    }
    
    /* unowned 引用和隐式解包可选值 */
    class Country {
        let name: String
        var capitalCity: City!
        init(name: String, capitalName: String) {
            self.name = name
            self.capitalCity = City(name: capitalName, country: self)
        }
        
        deinit {
            print("country \(name) is being deinitialized")
        }
    }
    
    class City {
        let name: String
        unowned var country: Country
        init(name: String, country: Country) {
            self.name = name
            self.country = country
        }
        
        deinit {
            print("city \(name) is being deinitialized")
        }
    }
    
    // 第三种解决循环引用的方法
    func learnThird() {
        let China = Country(name: "China", capitalName: "beijing")
        print("capital city:", China.capitalCity.name)
        
        
        
    }
    
    func learn() {
        
        localObject()
        
        var reference1: Person?
        var reference2: Person?

        reference1 = Person(name: "jobs")
        reference2 = reference1
        reference1 = nil
        print("set reference1 to nil")
        reference2 = nil

        // 循环强引用
        var john: Person?
        var unit4A: Apartment?
        
        john = Person(name: "john")
        unit4A = Apartment(unit: "unit4A")
        
        john!.apartment = unit4A
        unit4A!.tenant = john
        
        john = nil
        if nil == unit4A?.tenant {
            print("公寓的租客为nil")
            unit4A = nil
        }
        unit4A = nil
        
        print("ARC end")
        
        learnUnownedReference ()
        
        learnThird()
    }
}
