//
//  Cat.swift
//  08 oc_call_swift
//
//  Created by void on 2020/5/26.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

@objc(JKCar)
@objcMembers
class Car: NSObject {
    @nonobjc var price: Double // 不暴露给你OC
    var band: String // 暴露给你OC
    init(price: Double, band: String) {
        self.price = price
        self.band = band
    }
    
    @objc(drive) func run() -> Void {
        print(#function, ":", price, band, "run")
    }
    
    @objc static func run () {
        print("car run")
    }
    
    /*
     ##### 调用机制
     同一个方法，如果在OC中调用，则使用的是runtime的消息机制，如果是在Swift中调用，则使用的是虚表机制
     如果想在Swift中调用时也走runtime消息机制，则需要在方法前加上关键字`dynamic`
     */
    /* dynamic */ func autoDrive() {
        let speed = 10
        let time = 10
        let _ = speed * time
    }
}

extension Car {
    func test()  {
        print(band, "test")
    }
    func test1(x: Int)  {
        print(#function)
    }
    func test2(x: Int, y: Int)  {
        print(#function, x, y)
    }
    func test2(a: Double, b: Double)  {
        print(#function)
    }
    
    func testSelector() {
        // 名字没有歧义，带不带参数标签都行
        perform(#selector(test1))
        perform(#selector(test1(x:)))
        // 名字有歧义，要带上参数标签或者通过函数声明来定位
        perform(#selector(test2(x:y:)))
        perform(#selector(test2(a:b:)))
        perform(#selector(test2 as (Double, Double)->Void))
        
        self.autoDrive()
    }
}
