//
//  User.m
//  Copy
//
//  Created by xiongzenghui on 16/3/26.
//  Copyright © 2016年 xiongzenghui. All rights reserved.
//

#import "User.h"
#import "Account.h"

@implementation User

- (instancetype)initWithUid:(NSInteger)uid
                      uName:(NSString *)name
                  uPassword:(NSString *)password
                    Account:(Account *)account
{
    self = [super init];
    if (self) {
        //基本数据类型
        _uid = uid;
        
        //copy
        _uname = [name copy];
        _upassword = [password copy];
        
        //strong 直接指向传入的对象
        _account = account;
    }
    return self;
}


#pragma mark - 浅拷贝

- (id)copyWithZone:(NSZone *)zone {
    
    //1. 创建一个新的User
    User *newUser = [[User allocWithZone:zone] initWithUid:_uid
                                                     uName:_uname
                                                 uPassword:_upassword
                                                   Account:_account];//newUser.account直接指向的self.account
    
    //2. 返回新User容器对象
    return newUser;
}

#pragma mark - 深拷贝

- (instancetype)xzh_deepCopy {
    
    //1. 创建一个新的User
    User *newUser = [[User alloc] init];
    
    //2. 始化数据为当前User对象的所有非基本数据类型对象的copy拷贝值
    //基本数据类型直接复制
    newUser.uid = _uid;
    
    //Foundation类直接copy
    newUser.uname = [_uname copy];
    newUser.upassword = [_upassword copy];
    
    //自定义实体类指向自定义深拷贝协议方法
    if ([_account respondsToSelector:@selector(xzh_deepCopy)]) {
        newUser.account = [_account xzh_deepCopy];
    } else {
        newUser.account = [_account copy];
    }
    
    //3.
    return newUser;
}

#pragma mark - des

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %p, %@>",
            [self class],
            self,
            @{
              NSStringFromSelector(@selector(uid)) : @(_uid),
              NSStringFromSelector(@selector(uname)) : _uname,
              NSStringFromSelector(@selector(upassword)) : _upassword,
              NSStringFromSelector(@selector(account)) : _account,
              }];
}

@end
