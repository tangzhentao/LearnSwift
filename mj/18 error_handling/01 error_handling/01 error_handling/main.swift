//
//  main.swift
//  01 error_handling
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

print("Hello, World!")

enum CalculateError: Error {
    case zero(String)
    case overfloat
}

func divide(x: Int, y: Int) throws -> Int {
    if y == 0 {
        throw CalculateError.zero("divide 0")
    }
    return x/y
}


do {
    let z = try divide(x: 4, y: 0)
    print(z)
}
catch {
    print(error)
}

/* 详细的捕获异常 */
func catchError () {
    print("1")
    do {
        print("2")
        let _ = try divide(x: 4, y: 0)
        print("3")
    }
    catch CalculateError.zero(let msg){
        print(msg)
    }
    catch CalculateError.overfloat {
        print("溢出")
    }
    catch {
        print(error)
    }
    print("4")
}
catchError ()

enum CommonError: Error {
    
}

func throwError() {
    func test () throws {
        let _ = try divide(x: 4, y: 0)
    }
    
    do {
        try test()
    }
    catch let error as CommonError {
        print(error)
    }
    catch is CalculateError {
        print("CalculateError")
    }
    catch {
        print("other error")
    }
}
throwError()
