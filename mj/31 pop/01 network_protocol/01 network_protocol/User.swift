//
//  User.swift
//  01 network_protocol
//
//  Created by void on 2020/5/30.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 版本一
 */
/*
struct User {
    let name: String
    let message: String
    
    init?(data: Data) {
        guard let obj = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] else {
            return nil
        }
        guard let name = obj["name"] as? String else {
            return nil
        }
        guard let message = obj["message"] as? String else {
            return nil
        }
        
        self.name = name
        self.message = message
    }
}

enum HTTPMethod: String {
    case GET
    case POST
}

protocol Request {
    var host: String { get }
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String : Any] { get }
    
    associatedtype Respone
    func parseData(data: Data) -> Respone?

}

extension Request {
    
    func send(completionHandler: @escaping (Respone?) -> Void ) {
        let url = URL(string: host + path)!
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let task = URLSession.shared.dataTask(with: request) { (data, respone, error) in
            if let dat = data, let res = self.parseData(data: dat) {
                completionHandler(res)
            } else {
                completionHandler(nil)
            }
        }
        
        task.resume()
    }
}


struct UserRequst: Request {
    
    typealias Respone = User
    
    let name: String
    
    let host = "www.xxx.com"
    var path: String {
        return "/users/\(name)"
    }
    let method = HTTPMethod.GET
    let parameter = [String : Any]()
    
    func parseData(data: Data) -> User? {
        User(data: data)
    }
}
*/

/*
 方法一存在的问题：
 Request协议做的事太多了，功能不专一
  Request协议只需要关心请求的入口和期望的响应类型
 
 不需要关心：
 1. 发送这个请求
 2. 解析响应
 具体表现在：
 1.
 */
