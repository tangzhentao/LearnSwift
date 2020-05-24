//
//  main.swift
//  02 expression_pattern
//
//  Created by void on 2020/5/24.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 表达式模式
 - 表达式模式用在case中
 */

let point = (1, 2)
switch point {
case (0, 0):
    print("is origion")
case (-2...2, -2...2):
    print(point, "is near the origion")
default:
    print(point)
}

/*
 ##### 自定义表达式模式
 - 可以通过重载运算符，自定义表达式模式的匹配规则
 */
struct Student {
    var score = 0
    var name = ""
    
    /* 重载，用于模式匹配
     pattern是case后面的内容
     value 是switch后面的内容
     */
    
    // 重载数值相等
    static func ~= (pattern: Int, student: Student) -> Bool {
        pattern == student.score
    }
    // 重载闭区间
    static func ~= (pattern: ClosedRange<Int>, student: Student) -> Bool {
        pattern.contains(student.score)
    }
    // 重载办开半闭区间
    static func ~= (pattern: Range<Int>, student: Student) -> Bool {
        pattern.contains(student.score)
    }
}

func checkStudent(_ student: Student) {
    switch student {
    case 100:
        print("congratuatioon,", student.name)
    case 0:
    print("Oh, my God,", student.name)
    case 60...79:
        print(student.name, "pass")
    case 90..<100:
        print(student.name, "excellent")
    default:
        break
    }
}

let stu1 = Student(score: 100, name: "jim")
let stu2 = Student(score: 0, name: "tim")
let stu3 = Student(score: 70, name: "lim")
let stu4 = Student(score: 92, name: "jack")
var stuArray = [stu1, stu2, stu3, stu4]
for stu in stuArray {
    checkStudent(stu)
}

let stu5 = Student(score: 60, name: "lily")
if case 60 = stu5 {
    print(stu5.name, "6666")
}

// 自定义的模式，用于其他匹配情况
let info = (Student(score: 60, name: "rose"), "及格")
switch info {
case (60, let msg):
    print(msg)
default:
    break
}
