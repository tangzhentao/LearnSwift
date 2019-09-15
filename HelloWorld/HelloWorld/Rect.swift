//
//  Extension1.swift
//  HelloWorld
//
//  Created by itang on 2019/9/13.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
}
