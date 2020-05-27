//
//  main.m
//  08 oc_call_swift
//
//  Created by void on 2020/5/26.
//  Copyright © 2020 void. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "_8_oc_call_swift-Swift.h" // 访问Swift文件要导入这个头文件

/*
 #### OC调用Swift的代码
 - XCode自动生成了一个文件{target_name}-Swift.h，用于暴露Swift代码给OC，无论OC项目还是Swift项目
 - OC使用Swift代码需要两个步骤
    1. 在Swift代码中，标记暴露给OC，通过使用`@objcMembers`或`@objc`，类的话要继承`NSObject`
    2. 在OC中导入头文件`{target_name}-Swift.h`
    - 最终是否暴露成功，还需要考虑成员自身的访问权限
    - 如果不想暴露使用`@nonobjc`
    - `@objcMembers`代表暴露所有成员，包括扩展
 - 在Swift中标记暴露给OC的代码，在头文件`{target_name}-Swift.h`中都能看到
 ##### @objc
 - 可用于标记把代码暴露给OC
 - 可用于标记把代码暴露给OC时，修改名字: 类名、函数名、属性名等
 `#function`打印的是是原来的名字
 ##### Swift中使用`Selector`
 - 在Swift中依然可以使用选择器，使用`#Selector(name)`定义一个选择器
 必须是暴露给OC的方法才能使用选择器
 
 ##### 三个问题
 - 为啥Swift暴露给OC的类最终要继承自NSObject
 要继承它的方法
 - Swift调用OC和反过来都是如何调用的
 消息机制
 
 #### Swift、OC互调时函数时如何调用的
 - 在`Swift`中调用`OC`方法，走的是runtime消息机制
 - 在`OC`中调用`Swift`方法，走的也是runtime消息机制
 - 在`Swift`中调用`Swift`方法，走的是虚表机制，即使这个方法被暴露给`OC`了
 也即是说，同一个方法在OC中调用和在`Swift`中调用走的是不同的调用机制,
 在`Swift`中调用`Swift`方法走的永远都是虚表机制.
 - 有个暴露给OC的方法，如果在`Swift`中调用它时想走runtime消息机制，需要在方法前添加`dynamic`关键字
 注意：如果不是暴露给OC的方法，添加`dynamic`关键字没有效果
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...        
        JKCar *car = [[JKCar alloc] initWithPrice:100 band:@"bmw"];
        [car drive]; // 使用消息机制调用函数
        [JKCar run];
        [car test];
        
        NSString *band = car.band;
//        double price = car.price;
        [car testSelector];
        
        [car autoDrive];
        
    }
    return 0;
}
