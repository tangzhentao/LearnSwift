//
//  Subscripts.swift
//  HelloWorld
//
//  Created by itang on 2019/8/18.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Subscripts {
    
    // 乘法表
    struct TimesTable {
        let multiplier: Int
        subscript (index: Int) -> Int {
            return multiplier * index
        }
    }
    
    struct Matrix {
        let row: Int, column: Int
        var grids: [Double]
        
        init(row: Int, column: Int) {
            self.row = row
            self.column = column
            
            grids = Array(repeating: 0.0, count: row * column)
        }
        
        subscript (row: Int, column: Int) -> Double {
            
            set {
                assert(indexIsValidate(row: row, column: column))
                grids[row * self.column + column] = newValue
            }
            
            get {
                return grids[row * self.column + column]
            }
            
        }
        
        func indexIsValidate(row: Int, column: Int) -> Bool {
            return row >= 0 && row < self.row && column >= 0 && column < self.column
        }
    }
    
    // 类型下标 Swift 5.1 支持
    /*
    enum Level: Int {
        case low = 0, middle, hight
        static subscript (index: Int) -> Level {
            return Level(rawValue: index)!
        }
    }
    */
    
    func learn() {
        
        let timesTable = TimesTable(multiplier: 2)
        print("times:", timesTable[3])
        
        var matrix = Matrix(row: 3, column: 2)
        print("matrix:", matrix)
        matrix[0, 0] = 1
        matrix[1, 1] = 2
        print("matrix:", matrix)
        matrix[2 ,2] = 3
        
//        let level1 = Level[0]
//        print(level1)
    }
}
