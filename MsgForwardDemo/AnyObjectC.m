#import "AnyObjectC.h"

@implementation AnyObjectC

// 步骤一: 只有 methodSignatureForSelector 返回有效的 NSMethodSignature ，才会执行到 步骤二。
- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"methodSignatureForSelector");
    NSString *sel = NSStringFromSelector(aSelector);
    if ([sel isEqualToString:@"sendMessage"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

// 步骤二: 携带参数 NSInvocation 用于后续操作，NSInvocation携带有方法调用相关信息。
- (void)forwardInvocation:(NSInvocation *)anInvocation {
    NSLog(@"forwardInvocation");
    // 在这里处理 你要做的事情
}

@end
