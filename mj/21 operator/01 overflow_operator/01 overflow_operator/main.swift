//
//  main.swift
//  01 overflow_operator
//
//  Created by void on 2020/5/16.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

var u8max = uint8.max
print("uint8 max:", u8max) // 255

u8max &+= 1
print("u8max:", u8max) // 0

