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
    }
    
    class Room {
        
    }
    
    func learn() {
        let john = Person()
        if let num = john.resident?.numberOfRooms {
            print("john's residence has \(num) room(s).")
        } else {
            print("unable to retrieve the number of rooms.")
        }
        
        john.resident = Resident()
        if let num = john.resident?.numberOfRooms {
            print("john's residence has \(num) room(s).")
        } else {
            print("unable to retrieve the number of rooms.")
        }
    }
}
