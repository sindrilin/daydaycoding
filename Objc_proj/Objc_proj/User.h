//
//  User.h
//  Copy
//
//  Created by xiongzenghui on 16/3/26.
//  Copyright © 2016年 xiongzenghui. All rights reserved.
//

#import <Foundation/Foundation.h>

//引入深拷贝协议
#import "XZHDeepCopying.h"

@class Account;

@interface User : NSObject <NSCopying, XZHDeepCopying>

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *uname;

@property (nonatomic, copy) NSString *upassword;

@property (nonatomic, strong) Account *account;

//@property (nonatomic, strong) NSArray *accounts;

- (instancetype)initWithUid:(NSInteger)uid
                      uName:(NSString *)name
                  uPassword:(NSString *)password
                    Account:(Account *)account;

@end
