//
//  User2.swift
//  01 network_protocol
//
//  Created by void on 2020/5/30.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 版本二
 解耦
 可扩展行更好
 */

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
    
    var path: String { get }
    
    var method: HTTPMethod { get }
    var parameter: [String : Any] { get }
    
    associatedtype Respone: Decodable
}

protocol Decodable {
    static func parseData(data: Data) -> Self?
}

extension User: Decodable {
    static func parseData(data: Data) -> User? {
        User(data: data)
    }
}


struct UserRequst: Request {
    
    typealias Respone = User
    
    let name: String
    
    var path: String {
        return "/users/\(name)"
    }
    let method = HTTPMethod.GET
    let parameter = [String : Any]()
}

protocol Client {
    func send<R: Request>(_ reqst: R, completionHandler: @escaping (R.Respone?) -> Void)
    
    var host: String { get }
}

struct URLSessionClient: Client {
    let host = "https://api.xxx.com"
    
    func send<R: Request>(_ reqst: R, completionHandler: @escaping (R.Respone?) -> Void) {
        let url = URL(string: host + reqst.path)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, respone, error) in
            if let dat = data, let res = R.Respone.parseData(data: dat) {
                
                // 回到主线程处理
                DispatchQueue.main.async {
                    completionHandler(res)
                }
            } else {
                // 回到主线程处理
                DispatchQueue.main.async {
                    completionHandler(nil)
                }            }
        }
        
        task.resume()
    }
}

struct TestedClient: Client {
    var host: String = ""
    
    func send<R>(_ reqst: R, completionHandler: @escaping (R.Respone?) -> Void) where R : Request {
        switch reqst {
        case is UserRequst:
            let content = """
                        {"name" : "jim", "message" : "hello"}
                        """
            let data = content.data(using: .utf8)!
            let user = R.Respone.parseData(data: data)
            DispatchQueue.main.async {
                completionHandler(user)
            }
        default:
            print("unknown request")
        }
    }
}

struct LocalClient: Client {
    let host: String = ""
    
    func send<R>(_ reqst: R, completionHandler: @escaping (R.Respone?) -> Void) where R : Request {
        switch reqst {
        case is UserRequst:
            guard let fileUrl = Bundle.main.url(forResource: "user", withExtension: nil) else {
                fatalError()
            }
            guard let data = try? Data.init(contentsOf: fileUrl) else {
                fatalError()
            }
            let user = R.Respone.parseData(data: data)
            DispatchQueue.main.async {
                completionHandler(user)
            }
        default:
            print("unknown request")
        }
    }
}


