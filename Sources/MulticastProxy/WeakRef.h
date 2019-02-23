#import <Foundation/Foundation.h>

/**
 A weak object reference container
 
 - author: dmitry.volosach@gmail.com
 */
@interface WeakRef : NSObject

/**
 Object reference
 */
@property (nonatomic, weak) id value;

/**
 The designated initializer.
 
 - parameters:
    - value: object reference to hold
 */
- (instancetype)initWithValue:(id)value;

@end
