//
//  main.swift
//  06 CaseIterable
//
//  Created by void on 2020/5/13.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

enum Gender: CaseIterable {
    case male
    case femal
}

print(Gender.allCases.count)
for item in Gender.allCases {
    print(item)
}
