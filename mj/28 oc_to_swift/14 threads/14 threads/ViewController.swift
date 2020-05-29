//
//  ViewController.swift
//  14 threads
//
//  Created by void on 2020/5/28.
//  Copyright © 2020 void. All rights reserved.
//

import UIKit

class Cat {
    var name = ""
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print(type(of: self), ":", #function)
    }
}

class ViewController: UIViewController {
    
    var workItem: DispatchWorkItem = DispatchWorkItem {
        NSLog("这是一个延迟任务")
    }
    
    var shouldCancelTask = false
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function, "begin")
        
        self.createUI()

        // Do any additional setup after loading the view.
        
        // 主线程
//        print("main:", Thread.current)
//
//        // 子线程
//        DispatchQueue.global().async {
//            print("global:", Thread.current)
//        }
//
//        asyn {
//            print("asyn:", Thread.current)
//        }
        
        
        
        asyn(asynTask: {
            print("asynTask ---- begin")

            for i in 0...3 {
                print("sub task", i)
                sleep(1)
            }

            print("asynTask ---- end")

        }, mainTask:{
            print("mainTask ---- begin")
            print("mainTask ---- end")
        })
                
        print(#function, "end")
    }

    func createUI() {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 140, height: 40))
        button.setTitle("执行延迟任务", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(execDelayTask), for: .touchUpInside)
        button.center = self.view.center
        self.view.addSubview(button)
    }
    
    @objc func execDelayTask() {
        print("\(type(of: self)):", #function)
        
        delayAsyn(seconds: 3) {
            NSLog("UI还是OC的UI")
        }
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        NSLog("%@ begin", #function)
        
        if self.workItem.isCancelled {
            self.workItem = DispatchWorkItem {
                NSLog("这是一个延迟任务")
            }
        }
        
        if self.shouldCancelTask {
            print("取消任务")
            self.workItem.cancel()
        } else {
            let time = DispatchTime.now() + 2
//            DispatchQueue.main.asyncAfter(deadline: time, execute: self.workItem)
            DispatchQueue.global().asyncAfter(deadline: time, execute: self.workItem)
        }
        
        self.shouldCancelTask = !self.shouldCancelTask
        
        NSLog("%@ end", #function)
    }
}

typealias Task = () -> Void

func asyn(asynTask: @escaping Task, mainTask: Task? = nil) {
    
    _asyn (asynTask, mainTask)
}

private func _asyn(_ asynTask: @escaping Task, _ mainTask: Task? = nil)  {
    print(#function, "begin")
    
    let item = DispatchWorkItem(block: asynTask)
    DispatchQueue.global().async(execute: item)
    
    if let task = mainTask {
        // item任务完成后，通知在主线程中执行task
        item.notify(queue: DispatchQueue.main, execute: task)
    }

    print(#function, "end")
}

/* 把延迟执行 封装成一个便捷的方法 */
@discardableResult
func delayAsyn(seconds: Double, task: @escaping () -> Void) -> DispatchWorkItem {
    let time = DispatchTime.now() + seconds // seconds可是是Double，不能是Int、Uint64等，原因未知
    let workItem = DispatchWorkItem(block: task)
    DispatchQueue.global().asyncAfter(deadline: time, execute: workItem)
    
    return workItem
}

