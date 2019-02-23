#import <Foundation/Foundation.h>
#import "WeakRef.h"

/**
 Forwards invocations to defined set of receivers
 
 - author: dmitry.volosach@gmail.com
 */
@interface Multicaster : NSObject

/**
 Adds a ivocations receiver
 
 - parameters:
    - receiver: invocations handler
 */
- (void)addReceiver:(id)receiver;

/**
 Removes an invocations receiver, if necessary
 
 - parameters:
    - receiver: invocations handler
 */
- (void)removeReceiver:(id)receiver;

/**
 Returns list of receivers
 
 - returns: set of invocations receivers
 */
- (NSArray<WeakRef *> *)receivers;

@end
