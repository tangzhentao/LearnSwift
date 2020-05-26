//
//  Cat.m
//  07 swift_call_oc
//
//  Created by void on 2020/5/26.
//  Copyright © 2020 void. All rights reserved.
//

#import "Cat.h"

int sub (int a, int b) {
    return a - b;
}

int sum (int a, int b) {
    return a + b;
}

@implementation Cat

+ (instancetype)catWithName:(NSString *)name age:(int)age {
    NSLog(@"[%@ %@]", [self class], NSStringFromSelector(_cmd));
    return [[self alloc] initWithName:name age:age];
}
- (instancetype)initWithName:(NSString *)name age:(int)age {
    NSLog(@"[%@ %@]", [self class], NSStringFromSelector(_cmd));
    self = [super init];
    if (self) {
        _name = name;
        _age = age;
    }
    return self;
}

- (void)greet:(NSString *)name {
    NSLog(@"%@: miao~~, %@", _name, name);
}

+ (void)greet:(NSString *)name {
    NSLog(@"Cat: miao~~, %@", name);
}

+ (void)eat:(NSString *)food other:(NSString *)other {
    NSLog(@"Cat: eat %@, then %@", food, other);
}
- (void)eat:(NSString *)food other:(NSString *)other {
    NSLog(@"%@: eat %@, then %@", _name, food, other);
}

@end
