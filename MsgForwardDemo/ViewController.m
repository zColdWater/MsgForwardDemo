#import "ViewController.h"
#import "AnyObjectA.h"
#import "AnyObjectB.h"
#import "AnyObjectC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /**
        消息转发
        消息转发的三个阶段，每个阶段的例子都在下面。 配合文章阅读。
     
        看完记住这几点就可以:
        1. resolveInstanceMethod 给你一次机会 让你去动态添加一个实现 来阻止找不到方法的发生
        2. forwardingTargetForSelector 又给你一次机会，你不动态绑定一个实现就算了，那你告诉我，我去发给那个对象可以接这方法。
        3. methodSignatureForSelector & forwardInvocation 你不动态绑定实现，你又不转发给能接的对象，那么你自己返回方法签名给你回调 你想做什么就做什么吧。
     */
    
    // 例子一:
    // 第一阶段 解决转发 通过在 resolveInstanceMethod 内动态添加实现去解决。转发回调内返回 YES；
    AnyObjectA *obj1 = [AnyObjectA new];
    [obj1 sendMessage];
    
    // 例子二:
    // 第一阶段 不解决转发，直接返回 [super resolveInstanceMethod] 或者 返回NO 或者 不实现；进入第二阶段
    // 第二阶段 通过在 forwardingTargetForSelector 内返回一个实现了这个方法的对象来接收，来结束转发。
    AnyObjectB *obj2 = [AnyObjectB new];
    [obj2 sendMessage];
    
    // 例子三:
    // 第一阶段 不解决转发，直接返回 [super resolveInstanceMethod] 或者 返回NO 或者 不实现；进入第二阶段
    // 第二阶段 不实现 或者 返回父类实现 进入第三阶段
    // 第三阶段 通过在 实现 methodSignatureForSelector 和 forwardInvocation 来承接。
    AnyObjectC *obj3 = [AnyObjectC new];
    [obj3 sendMessage];
    

}


@end

