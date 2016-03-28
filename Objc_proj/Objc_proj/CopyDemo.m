//
//  CopyDemo.m
//  Objc_proj
//
//  Created by xiongzenghui on 16/3/28.
//  Copyright © 2016年 xiongzenghui. All rights reserved.
//

#import "CopyDemo.h"

#import "User.h"
#import "Account.h"

@implementation CopyDemo

- (void)test {
    [self testFoundation1];
    [self testFoundation2];
    [self testCopy];
    [self testEqual];
}

- (void)testFoundation1 {
    
    User *user1 = [User new];
    User *user2 = [User new];
    User *user3 = [User new];
    User *user4 = [User new];
    
    NSArray *array = @[user1, user2, user3];
    
    id copy1 = [array copy];
    NSLog(@"%d", (array == copy1));
    //    [copy1 addObject:user4];//会崩溃
    
    id copy2 = [array mutableCopy];
    NSLog(@"%d", (array == copy2));
    //    [copy2 addObject:user4];//不会崩溃，说明已经是一个可变数组对象了
    
}

- (void)testFoundation2 {
    
    User *user1 = [User new];
    User *user2 = [User new];
    User *user3 = [User new];
    User *user4 = [User new];
    
    NSMutableArray *mutaArray = [NSMutableArray new];
    [mutaArray addObject:user1];
    [mutaArray addObject:user2];
    [mutaArray addObject:user3];
    
    id copy1 = [mutaArray copy];
    NSLog(@"%d", (mutaArray == copy1));
    //    [copy1 addObject:user4];//会崩溃
    
    id copy2 = [mutaArray mutableCopy];
    NSLog(@"%d", (mutaArray == copy2));
    //    [copy2 addObject:user4];//不会崩溃，说明仍然是一个可变数组对象
    
}

- (void)testCopy {
    
    //原始对象
    Account *account = [[Account alloc] initWithName:@"account111" price:9999.99];
    User *user = [[User alloc] initWithUid:1823748234
                                     uName:@"user1111"
                                 uPassword:@"password1111"
                                   Account:account];
    
    //浅拷贝
    User *copy1 = [user copy];
    
    //深拷贝
    User *copy2 = [user xzh_deepCopy];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [user uname];
    });
}

- (void)testEqual {
    
    //    NSString *str1 = @"Hello World!";
    //    NSString *str2 = @"Hello World!";
    //
    //    //一、使用NSObject实现的 isEqual:
    //    NSLog(@"isEqual: %d", [str1 isEqual:str2]);
    //
    //    //二、使用NSString自己实现的 isEqualToString:
    //    NSLog(@"isEqualToString: %d", [str1 isEqualToString:str2]);
    
    Account *a1 = [[Account alloc] initWithName:@"name" price:100.0f];
    Account *a2 = [[Account alloc] initWithName:@"name" price:100.0f];
    Account *a3 = [[Account alloc] initWithName:@"name" price:100.0f];
    
    NSMutableSet *set = [NSMutableSet new];
    [set addObject:a1];
    [set addObject:a2];
    [set addObject:a3];
    
    NSLog(@"%@", set);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:a1 forKey:@"aaa"];
    
    [dic setObject:a2 forKey:@"bbb"];
    
    [dic setObject:a3 forKey:@"ccc"];
    
    
}


@end
