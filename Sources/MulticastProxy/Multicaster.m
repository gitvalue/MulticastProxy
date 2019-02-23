#import "Multicaster.h"

@interface Multicaster () {
    NSMutableArray<WeakRef *> *_receivers;
}

@end

@implementation Multicaster

- (instancetype)init {
    self = [super init];
    
    if (self != nil) {
        _receivers = [NSMutableArray array];
    }
    
    return self;
}

- (void)addReceiver:(id)receiver {
    WeakRef *receiverRef = [[WeakRef alloc] initWithValue:receiver];
    
    if (![_receivers containsObject:receiverRef]) {
        [_receivers addObject:receiverRef];
    }
}

- (void)removeReceiver:(id)receiver {
    [_receivers removeObject:[[WeakRef alloc] initWithValue:receiver]];
}

- (NSArray<WeakRef *> *)receivers {
    return _receivers;
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    BOOL result = NO;
    
    for (WeakRef *receiver in _receivers) {
        if ([receiver.value respondsToSelector:aSelector] && [receiver.value methodSignatureForSelector:aSelector]) {
            result = YES;
            break;
        }
    }
    
    return result;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    for (WeakRef *receiver in _receivers) {
        if ([receiver.value respondsToSelector:anInvocation.selector]) {
            [anInvocation invokeWithTarget:receiver.value];
        }
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *result = [super methodSignatureForSelector:aSelector];
    
    for (WeakRef *receiver in _receivers) {
        if ([receiver.value respondsToSelector:aSelector]) {
            result = [receiver.value methodSignatureForSelector:aSelector];
            break;
        }
    }
    
    return result;
}

@end
