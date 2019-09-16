//
//  Extensions.swift
//  HelloWorld
//
//  Created by tang on 2019/9/11.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

extension Double {
    var km: Double {
        return self * 1_000
    }
    var m: Double {
        return self
    }
    
    var cm: Double {
        return self / 100
    }
    
    var mm: Double {
        return self / 1_000
    }
    
    var ft: Double {
        return self / 3.28084
    }
    
}

class Extensions {
    
    func learn () {
        let oneInch = 25.4.mm
        
        print("one inch is \(oneInch) meters")
        let threeFeet = 3.0.ft
        print("three feet is \(threeFeet) meters")
    }
    
    
    
}
