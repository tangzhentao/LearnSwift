//
//  ViewController.swift
//  01 network_protocol
//
//  Created by void on 2020/5/30.
//  Copyright © 2020 void. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 使用版本一
//        let userRequst = UserRequst(name: "jim")
//        userRequst.send { (user) in
//            if let u = user {
//                print("\(u.name): \(u.message)")
//            } else {
//                print("error")
//            }
//        }
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 使用版本二
        
        // 请求
        let userRequest = UserRequst(name: "jim")
        // 处理响应
        let completionHandler: (UserRequst.Respone?) -> Void = { (user) in
            if let u = user {
                print("\(u.name): \(u.message)")
            } else {
                print("error occurred")
            }
        }
//        let client = URLSessionClient()
//        client.send(userRequest) { (user) in
//            if let u = user {
//                print("\(u.name): \(u.message)")
//            } else {
//                print("error occurred")
//            }
//        }
        
        // 测试 请求流程
        TestedClient().send(userRequest, completionHandler: completionHandler)
        
        // 从本地取数据
        LocalClient().send(userRequest, completionHandler: completionHandler)
    }
}

