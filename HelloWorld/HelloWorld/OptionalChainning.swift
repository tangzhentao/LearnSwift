//
//  OptionalChainning.swift
//  HelloWorld
//
//  Created by itang on 2019/8/24.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class OptionalChainning {
    class Person {
        var resident: Resident?
    }
    
    class Resident {
        var rooms = [Room]()
        var numberOfRooms: Int {
            return rooms.count
        }
        
        subscript (index: Int) -> Room {
            get {
                return rooms[index]
            }
            
            set {
                rooms[index] = newValue
            }
        }
        
        func printNumberOfRooms () {
            print("the number of rooms is \(numberOfRooms)")
        }
        
        var address: Address?
    }
    
    class Room {
        var name: String;
        init (name: String) {
            self.name = name
        }
    }
    
    class Address {
        var buildingName: String?
        var buildingNumber: String?
        var street: String?
        func buildingIdentifier() -> String? {
            if buildingName != nil {
                return buildingName
            } else if let street = street, let buildingNumber = buildingNumber {
                return street + " " + buildingNumber
            } else {
                return nil
            }
        }
    }
    
    func createAddress() -> Address {
        print("func createAddress() -> Address ")
        let address = Address()
        address.buildingNumber = "29"
        address.street = "xin hua lu"
        return address
    }
    
    func learn() {
        let john = Person()
        if let num = john.resident?.numberOfRooms {
            print("john's residence has \(num) room(s).")
        } else {
            print("unable to retrieve the number of rooms.")
        }
        
        // 通过可选链来设置属性
        let address = Address()
        address.buildingNumber = "29"
        address.street = "xin hua lu"
        john.resident?.address = createAddress() // 因为resident为nily所以设置address会失败
        
        // 通过可选链来调用方法，并判断是否成功
        if john.resident?.printNumberOfRooms() != nil {
            print("It is possible to print the number of rooms.")
        } else {
            print("It is not possible to print the number of rooms.")
        }
        
        // 通过判断返回值是否为nil，同样可以判断通过可选链设置属性是否成功
        if (john.resident?.address = address) != nil {
            print("it is possible to set address.")
        } else {
            print("it is not possible to set address.")
        }
        
        // 通过可选链式调用访问下标
        if let firstRoomName = john.resident?[0].name {
            print("the first room is \(firstRoomName).")
        } else {
            print("unable to retrieve the first room name.")
        }
        john.resident?[0] = Room(name: "bath room");
        
        let johnHourse = Resident()
        johnHourse.rooms.append(Room(name: "living room"))
        johnHourse.rooms.append(Room(name: "kitchen"))
        john.resident = johnHourse
        print("john had a resident.")
        if let firstRoomName = john.resident?[0].name {
            print("the first room is \(firstRoomName).")
        } else {
            print("unable to retrieve the first room name.")
        }
        
        let resident = Resident()
        john.resident = resident
        print("john had another resident.")
        john.resident?.address = createAddress()
        
        if john.resident?.printNumberOfRooms() != nil {
            print("It is possible to print the number of rooms.")
        } else {
            print("It is not possible to print the number of rooms.")
        }
        
        
        //
        var testScores = ["Dave" : [80, 50, 60, 90], "Bev" : [70, 77, 72, 76]]
        testScores["Dave"]?[0] = 92
        testScores["Bev"]?[0] += 1
        testScores["john"]?[0] = 72
        
        print("test scores:", testScores)
        
        // 连接多层可选链式调用
        john.resident?.address = nil
        if let street = john.resident?.address?.street {
            print("john's street is \(street)")
        } else {
            print("unable to retrieve the address")
        }
        
        let johnAddress = Address()
        johnAddress.street = "ren min lu"
        johnAddress.buildingNumber = "20"
        john.resident?.address = johnAddress
        if let street = john.resident?.address?.street {
            print("john's street is \(street)")
        } else {
            print("unable to retrieve the address")
        }
        
        if let buildingIdentifier = john.resident?.address?.buildingIdentifier() {
            print("john's building identifier is", buildingIdentifier)
        }
        
        if let beginWithThe = john.resident?.address?.buildingIdentifier()?.hasPrefix("The") {
            
            if beginWithThe {
                print("john's building identifier begin with \"The\"")
            } else {
                print("john's building identifier does not begin with \"The\"")
            }
        }
    }
}
