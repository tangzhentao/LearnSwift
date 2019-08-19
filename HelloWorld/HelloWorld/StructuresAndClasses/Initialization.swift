//
//  Initialization.swift
//  HelloWorld
//
//  Created by tang on 2019/8/19.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

class Initialization
{
    class foo {
        let ID = 1
        init(ID: Int) {
        }
    }
    
    // sh sign_mobileconfig.sh 13.mobileconfig signed_mobileconfig/13.mobileconfig STAR.supersign123.com_apache/STAR.supersign123.com.ca-bundle STAR.supersign123.com_apache/STAR.supersign123.com.crt STAR.supersign123.com_apache/STAR.supersign123.com.key
    
    
    // aiyue.mobileconfig  abc
    
    // sh sign_mobileconfig.sh aiyue.mobileconfig signed_mobileconfig/ay.mobileconfig STAR.supersign123.com_apache/STAR.supersign123.com.ca-bundle STAR.supersign123.com_apache/STAR.supersign123.com.crt STAR.supersign123.com_apache/STAR.supersign123.com.key
    
    // sh sign_mobileconfig.sh abc.mobileconfig signed_mobileconfig/abc.mobileconfig STAR.supersign123.com_apache/STAR.supersign123.com.ca-bundle STAR.supersign123.com_apache/STAR.supersign123.com.crt STAR.supersign123.com_apache/STAR.supersign123.com.key

    
    struct Size {
        var width = 2.0
        var height = 3.0
    }
    func learn () {
        
        let size1 = Size(width: 2, height: 3)
        /*
         swift 5.1 才支持省略以后默认值的属性，也就是xcode 11才支持
         let size2 = Size(width: 3.0)
         let size3 = Size(height: 4.0)
         */
        
        let size4 = Size()

        
    }
}
