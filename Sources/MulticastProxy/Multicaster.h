//
//  Multicaster.h
//  MulticastProxy
//
//  Created by Dmitry on 2/24/18.
//  Copyright © 2018 intervain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeakRef.h"

@interface Multicaster : NSObject

- (void)addReceiver:(id)receiver;
- (void)removeReceiver:(id)receiver;

- (NSArray<WeakRef *> *)receivers;

@end
