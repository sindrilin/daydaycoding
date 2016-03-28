//
//  XZHDeepCopying.h
//  Copy
//
//  Created by xiongzenghui on 16/3/26.
//  Copyright © 2016年 xiongzenghui. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  对象的深拷贝协议
 */
@protocol XZHDeepCopying <NSObject>

- (instancetype)xzh_deepCopy;

@end
