//: [Previous](@previous)

import Foundation

var str = "Hello Swift"

print(str)

func chongdie(array1: [Int], array2: [Int], count: Int) -> Bool {
    var cnt = 0
    for i in array1 {
        if array2.contains(i) {
            cnt += 1
        }
    }
    return count == cnt
}

let c1 = [2, 3, 4, 5]
let c2 = [1, 3, 4, 8]
let c3 = [1, 2, 7, 8]
let c4 = [1, 4, 6, 7]

let range = 1...8
outer: for i1 in range {
    for i2 in range {
        for i3 in range {
            for i4 in range {
                let array = [i1, i2, i3, i4]
                if chongdie(array1: array, array2: c1, count: 2) {
                    if chongdie(array1: array, array2: c2, count: 2) {
                        if chongdie(array1: array, array2: c3, count: 1) {
                            if chongdie(array1: array, array2: c4, count: 1) {
                                print("找到了:", array)
                                break outer
                            }
                        }
                    }
                }
            }
        }
    }
}



//: [Next](@next)
