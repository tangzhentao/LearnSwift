//
//  AppDelegate.swift
//  01 network_protocol
//
//  Created by void on 2020/5/30.
//  Copyright © 2020 void. All rights reserved.
//

import UIKit

/*
 这是在学校面向协议编程过程中，编写的一个demo，
 原文链接:
 https://onevcat.com/2016/11/pop-cocoa-1/
 https://onevcat.com/2016/12/pop-cocoa-2/
 */

/*
 #### 面向协议编程
 - 是Swift的一种编程范式，Apple于2015WWDC提出
 - 在Swift标准库中，能见到大量POP的影子
 - 同时，Swift也是一门面向对象的编程语言(OOP)
 - 在Swift开发中，OOP与POP是相辅相成的，任何一方都不能取代另一方
 - POP能弥补OOP一些设计上的不足
 ##### 回顾OOP
 三大特性：封装、继承、多态
 - 数据、操作封装
 - 对数据和操作的访问控制
 - 继承带来复用便利
 - 这种对世界的抽象方式更符合人类的思维习惯
 ##### OOP的不足
 - 不支持横切的关注(cross-cutting concerns)
 对于完全不同的两类对象，如果有共同点、相似点，面向对象不能很好地抽象。具体来说就是做不到代码复用。
 - 菱形继承问题(支持多继承的语言，如C++)
 子类的两个父类有相同的方法时，子类不知道继承那个父类的方法
 ##### POP注意点
 - 优先考虑协议，而不是基类
 - 优先考虑值类型(struct、enum)，而不是引用类型(class)
 - 巧用协议的扩展功能
 - 不要为了面向协议而使用协议
 */

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

