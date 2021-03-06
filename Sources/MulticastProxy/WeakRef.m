#import "WeakRef.h"

@implementation WeakRef

- (instancetype)initWithValue:(id)value {
    self = [super init];
    
    if (self != nil) {
        self.value = value;
    }
    
    return self;
}

- (BOOL)isEqual:(id)other {
    if (other == self) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else {
        return ((WeakRef *)other).value == self.value;
    }
}

- (NSUInteger)hash {
    return (NSUInteger)self.value;
}

@end
