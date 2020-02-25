//: [Previous](@previous)

import Foundation

enum Password {
    case number(Int, Int, Int, Int)
    case other
}
let pwd = Password.other
print(MemoryLayout<Password>.size) // 33
print(MemoryLayout<Password>.stride) // 40
print(MemoryLayout<Password>.alignment) // 8

print(MemoryLayout.size(ofValue: pwd)) // 33
print(MemoryLayout.stride(ofValue: pwd)) // 40
print(MemoryLayout.alignment(ofValue: pwd)) // 8


/*
 enum Season {
     case spring, summer, autumn, winter
 }

 print(MemoryLayout<Season>.size) // 1
 print(MemoryLayout<Season>.stride) // 1
 print(MemoryLayout<Season>.alignment) // 1
 */

enum Season: Int {
    case spring, summer, autumn, winter
}

print(MemoryLayout<Season>.size) // 1
print(MemoryLayout<Season>.stride) // 1
print(MemoryLayout<Season>.alignment) // 1

//: [Next](@next)
