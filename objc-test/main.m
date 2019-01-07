//
//  main.m
//  objc-test
//
//  Created by GongCF on 2018/12/16.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

@interface MyObject : NSObject

@property (nonatomic, strong) NSObject *obj;

@end

@implementation MyObject

+ (void)load {
    NSLog(@"zz %@", @"load");
}

+ (void)initialize
{
    if (self == [MyObject class]) {
        NSLog(@"zz %@", @"initialize");
    }
}

- (void)dealloc {
    NSLog(@"zz %@", @"dealloc");
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _obj = [[NSObject alloc] init];
    }
    return self;
}

- (void)haha {
    NSLog(@"zz %@", @"haha");
}

@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        Class newClass = objc_allocateClassPair(objc_getClass("NSObject"), "newClass", 0);
//                objc_registerClassPair(newClass);
//        id newObject = [[newClass alloc]init];
//        NSLog(@"%@",newObject);

        id obj = [[MyObject alloc] init];
        [obj haha];
        obj = nil;
    }
    return 0;
}
