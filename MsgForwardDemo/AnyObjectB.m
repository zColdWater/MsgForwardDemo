//
//  AnyObjectB.m
//  MsgForwardDemo
//
//  Created by Yongpeng Zhu 朱永鹏 on 2019/10/15.
//  Copyright © 2019 Henry. All rights reserved.
//

#import "AnyObjectB.h"
#import "AnyObjectBHelp.h"

@implementation AnyObjectB

- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"forwardingTargetForSelector");
    
    // 返回 AnyObjectBHelp 对象，因为其对象实现了 sendMessage 方法
    AnyObjectBHelp *help = [AnyObjectBHelp new];
    return help;
}


@end
