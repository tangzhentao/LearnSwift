//
//  Cat.h
//  07 swift_call_oc
//
//  Created by void on 2020/5/26.
//  Copyright © 2020 void. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

int sub(int a, int b);
int sum(int a, int b);

@interface Cat : NSObject

@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) int age;

+ (instancetype)catWithName:(NSString *)name age:(int)age;
- (instancetype)initWithName:(NSString *)name age:(int)age;

- (void)greet:(NSString *)name;
+ (void)greet:(NSString *)name;

+ (void)eat:(NSString *)food other:(NSString *)ohter;
- (void)eat:(NSString *)food other:(NSString *)ohter;


@end

NS_ASSUME_NONNULL_END
