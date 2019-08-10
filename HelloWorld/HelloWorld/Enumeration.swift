//
//  Enumeration.swift
//  HelloWorld
//
//  Created by itang on 2019/8/10.
//  Copyright © 2019 itang. All rights reserved.
//

import Foundation

enum HttpResponseCode: Int {
    case Success = 200
    case NotFound = 404
    case ServerInterError = 500
    
    func description () ->String {
        switch self {
        case .Success:
            return "Success"
        case .NotFound:
            return "NotFound"
        case .ServerInterError:
            return "ServerInterError"
        }
    }
}

class Enumeration {
    
    
    func httpRespond () -> HttpResponseCode {
        
        var responseCode = HttpResponseCode.Success
        
        let result = arc4random()
        print("original result: \(result)")
        let code = result % 3
        if code == 0 {
            responseCode = HttpResponseCode.Success
        } else if code == 1 {
            responseCode = HttpResponseCode.NotFound
        } else {
            responseCode = HttpResponseCode.ServerInterError
        }
        
        print("transfered result: \(code), \(responseCode), \(responseCode.description())")
        
        return responseCode
    }
    
    func useEnumeration() {
        for _ in 0...9 {
            httpRespond()
        }
    }
    
    func learn() {
        useEnumeration()
    }
}
