//
//  ViewController.swift
//  14 threads
//
//  Created by void on 2020/5/28.
//  Copyright © 2020 void. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 主线程
        print("main:", Thread.current)
        
        // 子线程
        DispatchQueue.global().async {
            print("global:", Thread.current)
        }
    }


}

