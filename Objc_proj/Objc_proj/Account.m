//
//  Account.m
//  Copy
//
//  Created by xiongzenghui on 16/3/26.
//  Copyright © 2016年 xiongzenghui. All rights reserved.
//

#import "Account.h"

@implementation Account

- (instancetype)initWithName:(NSString *)aName price:(Float32)aPrice
{
    self = [super init];
    if (self) {
        _name = [aName copy];
        _price = aPrice;
    }
    return self;
}

#pragma mark - 浅拷贝

- (id)copyWithZone:(NSZone *)zone {
    //1.
    Account *newAccount = [[Account allocWithZone:zone] initWithName:_name
                                                               price:_price];
    
    //2. 
    return newAccount;
}

#pragma mark - 深拷贝 >>> 因为没有对象属性类型，所以与浅拷贝一样

- (instancetype)xzh_deepCopy {
    //1.
    Account *newAccount = [[Account alloc] initWithName:_name
                                                  price:_price];
    
    //2.
    return newAccount;
}

#pragma mark - des

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, %@>",
            [self class],
            self,
            @{
              NSStringFromSelector(@selector(name)) : _name,
              NSStringFromSelector(@selector(price)) : @(_price),
              }];
}


- (BOOL)isEqualToAccount:(Account *)account {
    
    if (account == self) return YES;
    
    if (account.price != _price) return NO;
    if (![account.name isEqualToString:_name]) return NO;
    
    return YES;
}

- (BOOL)isEqual:(id)object {
    if ([self class] == [object class]) {
        return [self isEqualToAccount:object];
    } else {
        return [super isEqual:object];
    }
}

- (NSUInteger)hash {
    NSUInteger price_hash = _price;
    NSUInteger name_hash = [_name hash];
    return price_hash ^ name_hash;
}

@end
