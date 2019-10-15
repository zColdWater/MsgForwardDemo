//
//  AnyObjectA.m
//  MsgForwardDemo
//
//  Created by Yongpeng Zhu 朱永鹏 on 2019/10/15.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "AnyObjectA.h"
#import <objc/runtime.h>

@implementation AnyObjectA

void sendMessage (id self, SEL _cmd) {
    NSLog(@"%@ %s",self,sel_getName(_cmd));
}

// 消息转发 第一道转发关卡，通过动态给class添加方法实现IMP得以化解。
+ (BOOL)resolveInstanceMethod:(SEL)sel {
    NSLog(@"resolveInstanceMethod");
    if (sel == @selector(sendMessage)) {
        class_addMethod(self, sel, (IMP)sendMessage, "v:");
        return YES;
    }
    return [super resolveInstanceMethod:sel];
}

@end
