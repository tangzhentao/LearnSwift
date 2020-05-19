//
//  main.swift
//  06 protocol
//
//  Created by void on 2020/5/18.
//  Copyright © 2020 void. All rights reserved.
//

import Foundation

/*
 ##### 协议
 - 协议中定义的属性、方法自动接收协议的访问级别，不能单独设置访问级别
 public协议定义的要求也是public
 - 协议实现的访问级别必须 >= 类型的访问级别，或者>= 协议的访问级别
 就是说被实现的协议的方法、属性的访问级别，必须不小于协议和类型中较低的那个访问级别
 被实现的协议访问级别 >= min(协议访问级别, 类型访问级别)

 */

private protocol Living { // 协议其实是fileprivate
//    internal func breathe() // 报错
    func breathe()
}

/*
 其中ca-bundle为证书颁发机构的根证书，双击成功后在苹果的钥匙串文件中点击导出为pem文件即可
 openssl smime -sign -in unsigned.mobileconfig -out signed.mobileconfig -signer mbaike.crt -inkey mbaike.key -certfile ca-bundle.pem -outform der -nodetach
 */

private class Animal: Living { // 虽然协议是private，但Animal可以是internal
    fileprivate func breathe(){} // 报错：低于协议的fileprivate
}
