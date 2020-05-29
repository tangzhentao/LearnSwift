//
//  ViewController.swift
//  17 lock
//
//  Created by void on 2020/5/29.
//  Copyright © 2020 void. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        var cache = Cache()
        
        let group = DispatchGroup()
        
        let item1 = DispatchWorkItem {
            print(Thread.current, "------------ begin")
            for i in 0...99 {
                cache.store(i)
            }
            print(Thread.current, "------------ end")
        }
        let item2 = DispatchWorkItem {
            print(Thread.current, "****** begin")
            for i in 100...200 {
                cache.store(i)
            }
            print(Thread.current, "****** end")
        }
        DispatchQueue.global().async(group: group, execute: item1)
        DispatchQueue.global().async(group: group, execute: item2)

        // 等两个任务都结束了，回到主线程、打印数据
        group.notify(queue: DispatchQueue.main) {
            print("回到主线程")
            cache.show()
        }
        
    }


}

