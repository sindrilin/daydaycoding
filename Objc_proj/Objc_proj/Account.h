//
//  Account.h
//  Copy
//
//  Created by xiongzenghui on 16/3/26.
//  Copyright © 2016年 xiongzenghui. All rights reserved.
//

#import <Foundation/Foundation.h>

//引入深拷贝协议
#import "XZHDeepCopying.h"

@interface Account : NSObject <NSCopying, XZHDeepCopying>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) Float32 price;

- (instancetype)initWithName:(NSString *)aName price:(Float32)aPrice;

- (BOOL)isEqualToAccount:(Account *)account;

@end
