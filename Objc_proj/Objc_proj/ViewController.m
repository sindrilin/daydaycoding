//
//  ViewController.m
//  Objc_proj
//
//  Created by xiongzenghui on 16/3/28.
//  Copyright © 2016年 xiongzenghui. All rights reserved.
//

#import "ViewController.h"

//浅拷贝与深拷贝
#import "CopyDemo.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self doTestCopy];
}

- (void)doTestCopy {
    [[CopyDemo new] test];
}

@end
