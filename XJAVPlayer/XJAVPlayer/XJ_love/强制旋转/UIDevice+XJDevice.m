//
//  UIDevice+XJDevice.m
//  XJAVPlayer
//
//  Created by xj_love on 16/9/5.
//  Copyright © 2016年 Xander. All rights reserved.
//

#import "UIDevice+XJDevice.h"

@implementation UIDevice (XJDevice)
//调用私有方法实现
+ (void)setOrientation:(UIInterfaceOrientation)orientation {
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[self currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];
    [invocation invoke];
}

@end
